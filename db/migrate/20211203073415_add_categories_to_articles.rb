class AddCategoriesToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :group1, :bool, :default => false
    add_column :articles, :group2, :bool, :default => false
    add_column :articles, :group3, :bool, :default => false
    add_column :articles, :group4, :bool, :default => false
    add_column :articles, :group5, :bool, :default => false
    add_column :articles, :group6, :bool, :default => false
    add_column :articles, :group7, :bool, :default => false
  end
end
