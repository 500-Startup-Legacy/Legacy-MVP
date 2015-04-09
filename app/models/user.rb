class User < ActiveRecord::Base
  before_save {self.email = email.downcase }
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email, presence:true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true
  has_secure_password

  def full_name
    "#{first_name} #{last_name}"
  end
end
