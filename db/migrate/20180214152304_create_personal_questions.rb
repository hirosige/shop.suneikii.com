class CreatePersonalQuestions < ActiveRecord::Migration[5.1]
  def change
    create_table :personal_questions do |t|
      t.string :title
      t.text :description
      t.integer :user_id
      t.string :status
      t.text :answer

      t.timestamps
    end
  end
end
