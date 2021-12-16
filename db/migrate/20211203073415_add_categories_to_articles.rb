class AddCategoriesToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :group1, :boolean
    add_column :articles, :group2, :boolean
    add_column :articles, :group3, :boolean
    add_column :articles, :group4, :boolean
    add_column :articles, :group5, :boolean
    add_column :articles, :group6, :boolean
  end
end
