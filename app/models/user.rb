class User<ActiveRecord::Base

#PaperClip
has_attached_file :avatar, :styles => {medium: '200x200', thumb: '100x100'},

:s3_credentials => {
  :bucket =>'group3dev',
  :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
}

validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/




  attr_accessor :remember_token, :activation_token, :reset_token
  before_save   :downcase_email
  before_create :create_activation_digest


  validates :username,  presence: true, length: { maximum: 50 }
  validates :street_address,  presence: true, length: { maximum: 100 }
  validates :city,  presence: true, length: { maximum: 75 }
  validates :country,  presence: true, length: { maximum: 75 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }
    has_secure_password

      validates :password, presence: true, length: { minimum: 6 }, allow_nil: true

  # Returns the hash digest of the given string.
  def User.digest(string)
    cost = ActiveModel::SecurePassword.min_cost ? BCrypt::Engine::MIN_COST :
                                                  BCrypt::Engine.cost
    BCrypt::Password.create(string, cost: cost)
  end

  # Concatenate address into single string
  def address
    [street_address, city, country].join(' ')
  end

   def User.new_token
    SecureRandom.urlsafe_base64
   end

    def remember
    self.remember_token = User.new_token
    update_attribute(:remember_digest, User.digest(remember_token))
    end

    # Returns true if the given token matches the digest.
  def authenticated?(attribute, token)
    digest = send("#{attribute}_digest")
    return false if digest.nil?
    BCrypt::Password.new(digest).is_password?(token)
  end

  def forget
    update_attribute(:remember_digest, nil)
  end

  # Calculate Lat/Lng from address
  geocoded_by :address
  after_validation :geocode

# Map Searching
  # Username Search
  def self.search(search)
    where("username ILIKE ?", "%#{search}%")
  end

  # Game Search
  def self.gameSearch(lol, dota2, smite, hots)
    # Double verification trick
    where("(lol = ? AND lol = 'true') OR (dota2 = ? AND dota2 = 'true') OR (smite = ? AND smite = 'true') OR (hots = ? AND hots = 'true')", "#{lol}", "#{dota2}", "#{smite}", "#{hots}")
  end

  # Activates an account.
  def activate
    update_attribute(:activated,    true)
    update_attribute(:activated_at, Time.zone.now)
  end

  # Sends activation email.
  def send_activation_email
    UserMailer.account_activation(self).deliver_now
  end

    # Sets the password reset attributes.
  def create_reset_digest
    self.reset_token = User.new_token
    update_attribute(:reset_digest,  User.digest(reset_token))
    update_attribute(:reset_sent_at, Time.zone.now)
  end

  # Sends password reset email.
  def send_password_reset_email
    UserMailer.password_reset(self).deliver_now
  end

    # Returns true if a password reset has expired.
  def password_reset_expired?
    reset_sent_at < 2.hours.ago
  end

    #micropost association
  has_many :microposts, dependent: :destroy

  def feed
    Micropost.where("user_id = ?", id)
  end


private

 def downcase_email
      self.email = email.downcase
 end


 def create_activation_digest
      self.activation_token  = User.new_token
      self.activation_digest = User.digest(activation_token)
 end
end
