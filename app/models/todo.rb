class Todo < ApplicationRecord
  belongs_to :user, optional: true

  validates :title, presence: true, length: { minimum: 3 }
  validates :due_date, presence: false

  enum priority: { low: 0, medium: 1, high: 2 }

  def priority_label
    self.priority ? self.priority.capitalize : 'Unassigned'
  end

end
