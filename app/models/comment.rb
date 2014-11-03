class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :topic, :counter_cache => true

  validates_presence_of :content

  def title
    self.topic.title
  end

end
