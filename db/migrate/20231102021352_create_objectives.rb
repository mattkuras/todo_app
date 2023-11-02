class CreateObjectives < ActiveRecord::Migration[7.1]
  def change
    create_table :objectives do |t|
      t.references :user, null: false, foreign_key: true
      t.references :resolution, foreign_key: true
      t.references :goal, foreign_key: true
      t.string :name, null: false
      t.text :description

      t.timestamps
    end
  end
end
