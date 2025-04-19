class CreateTasks < ActiveRecord::Migration[8.0]
  def change
    create_table :tasks do |t|
      t.belongs_to :user, null: false, foreign_key: true
      t.text :description, null: false
      t.date :scheduled_on, null: false
      t.belongs_to :block, null: false, foreign_key: true

      t.timestamps
    end
  end
end
