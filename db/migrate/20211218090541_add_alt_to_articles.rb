class AddAltToArticles < ActiveRecord::Migration[6.1]
  def change
    add_column :articles, :alt, :string
  end
end
