class Order < ApplicationRecord
    belongs_to :user
    has_one :sock
end