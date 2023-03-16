class Todo < ApplicationRecord
	self.table_name = :todos
	 has_one_attached :image
end