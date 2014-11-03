class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :topics
  has_many :comments

  def display_name
    self.username
  end

  def set_admin!
    self.role = "admin"
    self.save!
  end

  def admin?
    self.role == "admin"
  end

end
