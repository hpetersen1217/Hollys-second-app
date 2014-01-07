class AddWikiToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :wiki_id, :integer
    add_index :articles, :wiki_id
  end
end
