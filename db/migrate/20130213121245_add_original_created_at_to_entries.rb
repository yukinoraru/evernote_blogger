class AddOriginalCreatedAtToEntries < ActiveRecord::Migration
  def change
    add_column :entries, :original_created_at, :datetime
  end
end
