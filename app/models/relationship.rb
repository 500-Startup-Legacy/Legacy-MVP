class Relationship < ActiveRecord::Base
  belongs_to :memorializer, class_name: "User"
  belongs_to :memorialized, class_name: "User"
end
