class AddIdsToTable < ActiveRecord::Migration
  def change
    add_column :tables, :user_id2, :integer
    add_column :tables, :user_id3, :integer
    add_column :tables, :user_id4, :integer
    add_column :tables, :user_id5, :integer
    add_column :tables, :user_id6, :integer
    add_column :tables, :user_id7, :integer
  end
end
