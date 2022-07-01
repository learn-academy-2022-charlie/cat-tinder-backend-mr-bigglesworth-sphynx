class Dino < ApplicationRecord
    validates :name, :age, :enjoys, :image, presence: true
    validates :enjoys, length: 10
end
