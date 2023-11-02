class AddQuarterToObject < ActiveRecord::Migration[7.1]
  def change
    create_enum :quarter, %w[1 2 3 4]
    add_column :objectives, :quarter, :enum, enum_type: :quarter, null: false
    add_column :objectives, :completed, :boolean, default: false, null: false
  end
end
