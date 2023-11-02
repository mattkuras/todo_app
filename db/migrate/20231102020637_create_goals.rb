class CreateGoals < ActiveRecord::Migration[7.1]
  def change
    create_table :goals do |t|
      t.string :title, null: false
      t.references :user, null: false, foreign_key: true
      t.text :description

      t.timestamps
    end
  end
end
