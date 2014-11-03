class Category < ActiveRecord::Base

  has_many :categoryships, :dependent => :destroy
  has_many :topics, :through => :categoryships

  validates_presence_of :name

end
