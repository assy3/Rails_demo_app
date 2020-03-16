class Post < ApplicationRecord
	# validates :content, {presence: true}
	validates :content, {presence: true, length: {maximum: 140}}
end
