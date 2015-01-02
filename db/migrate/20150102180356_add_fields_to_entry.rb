class AddFieldsToEntry < ActiveRecord::Migration
  def change
    add_column :entries, :guid, :string
    add_column :entries, :update_sequence_num, :integer
    add_column :entries, :original_updated_at, :datetime
  end
end
