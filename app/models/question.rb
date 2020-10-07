class Question < ApplicationRecord
    validates :description, presence: true, uniqueness: true
end
