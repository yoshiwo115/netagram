class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :neta

    validates_uniqueness_of :neta_id, scope: :user_id
end
