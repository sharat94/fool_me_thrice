class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_secure_password

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :user_topics
  has_many :topics, :through => :user_topics
end
