class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :filename
      t.binary :body, :limit => 10.megabytes
      t.string :extension
      t.string :mime
      t.string :body_hash

      t.references :entry

      t.timestamps
    end
  end
end
