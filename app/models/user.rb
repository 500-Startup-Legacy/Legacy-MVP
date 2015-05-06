class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_validation do 
    if self.phone_number
      self.phone_number = phone_number.gsub(/[^0-9]/, "") 
      self.phone_number.slice!(0) if self.phone_number[0] == '1' && self.phone_number.length > 10
    end
  end
  before_create :create_remember_token
  validates :first_name, presence:true
  validates :last_name, presence:true
  validates :email, presence:true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, uniqueness: true
  validates :legacy_contact_email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }, allow_blank:true
  validates :password, length: { minimum: 6 }
  validates :phone_number, presence:true, uniqueness:true, length: { is:10 }
  has_secure_password

  has_many :subjects, dependent: :destroy


  def full_name
    "#{first_name} #{last_name}"
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.digest(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def get_memorialized_user_by_twilio_number(twilio_number)
    self.relationships.each do |relationship|
      return User.find(relationship.memorialized_id) if relationship.twilio_number == twilio_number
    end
  end

  def get_memorializing_twilio_number(other_user)
    relationship = self.relationships.find_by(memorialized_id:other_user.id)
    return relationship.twilio_number if relationship
  end

  def memories
    subjects = self.subjects
    subjects.map {|subject| subject.memories }.flatten
  end

  def as_json(options = {})
    super(options.merge({ except: [:password_digest, :remember_token, :phone_number, :created_at, :updated_at, :legacy_contact_email] })) 
  end 

  private
    def create_remember_token
      self.remember_token = User.digest(User.new_remember_token)
    end

end
