class Categoryship < ActiveRecord::Base

  belongs_to :topic
  belongs_to :category

  validates_presence_of :topic
  validates_presence_of :category


end
