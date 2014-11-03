class Topic < ActiveRecord::Base

  has_many :comments

  has_many :categoryships
  has_many :categories, :through => :categoryships

  validates_presence_of :title

end
