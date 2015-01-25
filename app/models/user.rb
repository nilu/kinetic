class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable

  has_many :contacts

  validates :email, :presence => true, :uniqueness => true
  validates :password, :presence => true, :length => {:minimum => 6}

  # protected
  # def password_required?
  #   false
  # end
end
