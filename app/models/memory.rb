class Memory < ActiveRecord::Base
  belongs_to :user
  default_scope -> { order('created_at DESC') }
  validates :user_id, presence: true
  validates :memorialized_user_id, presence: true

  def group_tag
    relationship.group_tag
  end

  private
  def relationship
    Relationship.find_by(memorializer_id: user_id, memorialized_id: memorialized_user_id)
  end

end
