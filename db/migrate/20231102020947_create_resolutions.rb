class CreateResolutions < ActiveRecord::Migration[7.1]
  def change
    create_table :resolutions do |t|
      t.string :name, null: false
      t.references :user, null: false, foreign_key: true
      t.references :goal, foreign_key: true
      t.integer :year, null: false
      t.text :description

      t.timestamps
    end
  end
end
