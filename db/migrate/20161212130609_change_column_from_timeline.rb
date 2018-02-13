class ChangeColumnFromTimeline < ActiveRecord::Migration[5.0]
  def change
    rename_column :timelines, :message_id, :timeline_message_id
  end
end
