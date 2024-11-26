class User < ApplicationRecord
  # before_action :authenticate_user!
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :events

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end
