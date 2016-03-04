class User<ActiveRecord::Base
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

  # Concatenate address into single string  
  def address
    [street_address, city, country].join(' ')
  end
  
  # Calculates long/lat from user address
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
  

end 