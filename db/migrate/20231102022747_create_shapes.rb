class CreateShapes < ActiveRecord::Migration[7.1]
  def change
    create_enum :months, %w[January February March April May June July August September October November December]
    create_table :shapes do |t|
      t.string :name, null: false
      t.string :description
      t.references :user, null: false, foreign_key: true
      t.references :objective, foreign_key: true
      t.references :resolution, foreign_key: true
      t.enum :month, enum_type: :months, null: false
      t.boolean :completed, default: false, null: false

      t.timestamps
    end
  end
end
