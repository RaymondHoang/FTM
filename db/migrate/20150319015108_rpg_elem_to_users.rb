class RpgElemToUsers < ActiveRecord::Migration
  def change
    add_column :users, :nickname, :string
    add_column :users, :exp, :integer
    add_column :users, :exptolvl, :integer
    add_column :users, :lvl, :integer
    add_column :users, :status, :string
  end
end
