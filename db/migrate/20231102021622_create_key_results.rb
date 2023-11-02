class CreateKeyResults < ActiveRecord::Migration[7.1]
  def change
    create_table :key_results do |t|
      t.string :name
      t.text :description
      t.boolean :completed, default: false
      t.integer :progress, default: 0
      t.references :objective, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
