class Post < ApplicationRecord
    validates :title, presence: true
    validates :category, {in: ["Fiction","Non-Fiction"]} #Checks that the category is either of the the two elements in the array
    validates :content, length: {minimum: 100}
end
