class CreateTimelineMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :timeline_messages do |t|
      t.string :message

      t.timestamps null: false
    end
  end
end
