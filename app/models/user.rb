class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  attachment :profile_image #_idは含めない
  has_many :netas, dependent: :destroy #userが削除されたら投稿も削除する

  has_many :favorites, dependent: :destroy
    
  validates :username, presence: true

  def already_favorited?(neta)
    self.favorites.exists?(neta_id: neta.id)
  end
end
