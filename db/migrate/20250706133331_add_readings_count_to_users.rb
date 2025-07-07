class AddReadingsCountToUsers < ActiveRecord::Migration[8.0]
  def change
    add_column :users, :readings_count, :integer, default: 0
  end
end
