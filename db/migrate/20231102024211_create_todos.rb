class CreateTodos < ActiveRecord::Migration[7.1]
  def change
    create_table :todos do |t|
      t.references :user, null: false, foreign_key: true
      t.string :name, null: false
      t.boolean :completed, default: false, null: false
      t.boolean :backlog, default: false, null: false
      t.references :weekly_intention, foreign_key: true
      t.references :shape, foreign_key: true

      t.timestamps
    end
  end
end
