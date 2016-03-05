class User<ActiveRecord::Base
  
  attr_accessor :remember_token
  before_save { self.email = email.downcase }
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
    
     def authenticated?(remember_token)
        return false if remember_digest.nil?
        BCrypt::Password.new(remember_digest).is_password?(remember_token)
     end
     
  def forget
    update_attribute(:remember_digest, nil)
  end
  
  geocoded_by :address
  after_validation :geocode


end 