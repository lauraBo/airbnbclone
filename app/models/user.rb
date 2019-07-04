class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable

         validates :fullname, presence: true, length: {maximum: 50}

  has_many :rooms
  has_many :reservations

  has_one :setting
  after_create :add_setting


def add_setting
  Setting.create(user: self, enable_sms: true, enable_email: true)
end 


end
