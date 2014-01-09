class RenameDescritpionColumnToDescription < ActiveRecord::Migration
  def self.up
    rename_column :todo_lists, :descritpion, :description
  end

  def self.down
    rename_column :todo_lists, :description, :descritpion
  end
end
