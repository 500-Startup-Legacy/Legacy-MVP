class Subject < ActiveRecord::Base
  belongs_to :user
  has_many :memories
  validates :user_id, presence: true
  validates :group_tag, presence: true
  validates :name, presence: true
  validates :email, presence:true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i }

  before_save do
    used_numbers = user.subjects.map { |subject| subject.twilio_number }
    self.twilio_number = (Rails.application.config.twilio_numbers - used_numbers).first
  end

end
