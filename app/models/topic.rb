class Topic < ActiveRecord::Base

  belongs_to :user

  has_many :comments

  has_many :categoryships
  has_many :categories, :through => :categoryships

  validates_presence_of :title

  def authors
    arr = [self.user]
    arr = arr +  self.comments.map{ |c| c.user }
    arr.compact
  end

end
