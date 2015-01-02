class AddFieldsToResource < ActiveRecord::Migration
  def change
    add_column :resources, :guid, :string
    add_column :resources, :update_sequence_num, :integer
    add_column :resources, :width, :integer
    add_column :resources, :height, :integer
  end
end
