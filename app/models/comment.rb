class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :topic, :counter_cache => true

  validates_presence_of :content

  def title
    self.topic.title
  end

  def can_delete_by?(user)
    ( self.user == user ) || ( self.topic.try(:user) == user ) || user.admin?
  end

end
