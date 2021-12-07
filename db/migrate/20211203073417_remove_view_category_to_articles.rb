class RemoveViewCategoryToArticles < ActiveRecord::Migration[6.1]
  def change
    remove_column :articles, :view
  end
end
