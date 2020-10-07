class Question < ApplicationRecord
    validates :name, presence: true, uniqueness: true
end
