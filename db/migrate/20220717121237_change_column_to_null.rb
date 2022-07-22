class ChangeColumnToNull < ActiveRecord::Migration[6.1]
  def up
    change_column :items, :genre_id, :integer, null: false
  end

  def down
    change_column :items, :genre_id, :integer
  end
end
