class Task < ApplicationRecord
  belongs_to :user
  belongs_to :block

  validates :completed, inclusion: [ true, false ]

  def self.overdue(user_id)
    where("scheduled_on < ? AND completed = ?", Date.today, false)
      .where(user_id: user_id)
  end
end
