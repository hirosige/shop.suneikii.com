class CreateUseTermArticleDetails < ActiveRecord::Migration[5.0]
  def change
    create_table :use_term_article_details do |t|
      t.text :description
      t.integer :use_term_article_id

      t.timestamps null: false
    end
  end
end
