class Block < ApplicationRecord
  belongs_to :user

  before_destroy :ensure_minimum_blocks

  validates :order, uniqueness: { scope: :user, message: "must be unique" }

  has_many :tasks, dependent: :destroy

  private

  def ensure_minimum_blocks
    if user.blocks.count <= 2
      errors.add(:base, "A user must have at least two blocks.")
      throw(:abort)
    end
  end
end
