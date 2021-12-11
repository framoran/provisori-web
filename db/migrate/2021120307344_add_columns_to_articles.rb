class AddColumnsToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :like, :integer, :default => 0
  end
end
