class Micropost < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order(created_at: :desc) }
  
  #PaperClip
has_attached_file :avatar, :styles => {small: '100x100'},

:s3_credentials => {
  :bucket =>'group3dev',
  :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
  :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
}

validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/
  
  validates :user_id, presence: true
  validates :content, presence: true, length: { maximum: 140 }
  



end

