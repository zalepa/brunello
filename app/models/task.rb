class Task < ApplicationRecord
  belongs_to :user
  belongs_to :block

  validates :completed, inclusion: [ true, false ]
end
