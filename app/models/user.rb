class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image #_idは含めない
  has_many :netas, dependent: :destroy #userが削除されたら投稿も削除する

  validates :username, presence: true
end
