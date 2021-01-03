class Neta < ApplicationRecord
    belongs_to :user
    attachment :image

    has_many :favorites, dependent: :destroy
    
    with_options presence: true do
        validates :title
    end
end
