class Todo < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true, length: { minimum: 3 }
  validates :due_date, presence: false

end
