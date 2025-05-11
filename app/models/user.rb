class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  before_create :associate_blocks

  has_many :blocks, dependent: :destroy
  has_many :tasks,  dependent: :destroy

  validates :blocks, length: { mininum: 2, maximum: 2 }

  def overdue
    Task.overdue(id)
  end

  private

  def associate_blocks
    blocks.build([ { name: "morning", order: 0 }, { name: "afternoon", order: 1 } ])
  end
end
