class User < ActiveRecord::Base
  before_save {self.email = email.downcase }
  before_create :create_remember_token
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email, presence:true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true
  has_secure_password

  has_many :relationships, foreign_key: "memorializer_id", dependent: :destroy
  has_many :memorialized_users, through: :relationships, source: :memorialized

  def full_name
    "#{first_name} #{last_name}"
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private
    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end
end
