class Relationship < ActiveRecord::Base
  belongs_to :memorializer, class_name: "User"
  belongs_to :memorialized, class_name: "User"
  validates :group_tag, presence: true, inclusion: ['family', 'friend', 'coworker']
  validates :memorializer_id, presence: true
  validates :memorialized_id, presence: true
end
