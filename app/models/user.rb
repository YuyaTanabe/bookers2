class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # deviseでemailを不必要にする
 def email_required?
   false
 end
 def email_changed?
   false
 end

  has_many :books, dependent: :destroy

  attachment :profile_image

  validates :email, presence: true, on: :create

  # validates :password, presence: true, on: :create

  validates :name, presence: true

  validates :name, length: { minimum: 2 }

  validates :name, length: { maximum: 20 }

  validates :introduction, length: { maximum: 50 }

end
