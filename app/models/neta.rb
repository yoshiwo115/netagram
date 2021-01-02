class Neta < ApplicationRecord
    belongs_to :user
    attachment :image
    
    with_options presence: true do
        validates :title
    end
end
