class CreateTable < ActiveRecord::Migration
  def change
    create_table :tables do |t|
      t.integer :table_id
    end
  end
end
