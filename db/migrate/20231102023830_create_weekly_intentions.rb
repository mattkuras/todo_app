class CreateWeeklyIntentions < ActiveRecord::Migration[7.1]
  def change
    create_enum :intention_type, %w[task habit nice_to_have]
    create_table :weekly_intentions do |t|
      t.string :name
      t.references :user, null: false, foreign_key: true
      t.references :shape, foreign_key: true
      t.enum :intention_type, enum_type: :intention_type, default: 'task'
      t.boolean :completed, default: false, null: false

      t.timestamps
    end
  end
end
