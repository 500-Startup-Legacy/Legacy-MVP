class Memory < ActiveRecord::Base
  belongs_to :subject
  default_scope -> { order('created_at DESC') }
  validates :subject_id, presence: true

  def group_tag
    subject.group_tag
  end

  private
  def relationship
    Relationship.find_by(memorializer_id: user_id, memorialized_id: memorialized_user_id)
  end

end
