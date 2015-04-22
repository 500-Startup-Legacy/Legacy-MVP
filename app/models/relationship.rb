class Relationship < ActiveRecord::Base
  belongs_to :memorializer, class_name: "User"
  belongs_to :memorialized, class_name: "User"
  validates :group, presence: true, inclusion: ['family', 'friend', 'coworker']
end
