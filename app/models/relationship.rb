class Relationship < ActiveRecord::Base

  before_save do
    used_numbers = memorializer.relationships.map { |relationship| relationship.twilio_number }
    self.twilio_number = (Rails.application.config.twilio_numbers - used_numbers).first
  end

  belongs_to :memorializer, class_name: "User"
  belongs_to :memorialized, class_name: "User"
  validates :group_tag, presence: true, inclusion: ['family', 'friend', 'coworker']
  validates :memorializer_id, presence: true
  validates :memorialized_id, presence: true


# class TwilioNumberUniquenessValidator < ActiveModel::Validator
#   def validate(record)
#     used_numbers = memorializer.relationships.map { |relationship| relationship.twilio_number }
#     unless record.twilio_number.starts_with? 'X'
#       record.errors[:twilio_number] << "Can't re-use the same Twilio number again for the same memorializer"
#     end
#   end
# end

end
