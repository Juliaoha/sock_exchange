class Sock < ApplicationRecord
    belongs_to :user
    has_one_attached :image
    validates :title, presence: true, length: {minimum: 5, maximum: 100}
    validates :description, presence: true, length: {minimum: 10, maximum: 300}
    validates :size, presence: true
    validates :brand, presence: true
    validates :colour, presence: true
    validates :quality, presence: true
    validates :foot, presence: true
    validates :price, presence: true
    validates :user_id, presence: true
end
