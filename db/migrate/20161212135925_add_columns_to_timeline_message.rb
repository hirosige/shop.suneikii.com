class AddColumnsToTimelineMessage < ActiveRecord::Migration[5.0]
  def change
    add_column :timeline_messages, :user_id, :integer
    add_column :timeline_messages, :posted_at, :datetime
  end
end
