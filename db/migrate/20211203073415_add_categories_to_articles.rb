class AddCategoriesToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :group1, :bool
    add_column :articles, :group2, :bool
    add_column :articles, :group3, :bool
    add_column :articles, :group4, :bool
    add_column :articles, :group5, :bool
    add_column :articles, :group6, :bool
  end
end
