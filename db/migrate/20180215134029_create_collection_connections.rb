class CreateCollectionConnections < ActiveRecord::Migration[5.1]
  def change
    create_table :collection_connections do |t|
      t.integer :collection_id
      t.integer :good_id

      t.timestamps
    end
  end
end
