class User < ApplicationRecord
    has_many :recipes 
    has_many :ingredients, through: :recipes 
    has_many :allergens 
end
