class CreateElementsRelatedToArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :elements do |t|
      t.string :view, :default => 'default'
      t.string :subtitle_h1, :default => 'null'
      t.string :subtitle_h2, :default => 'null'
      t.string :elements_type, :default => 'article'
      t.string :src, :default => 'null'
      t.timestamp :created_at
      t.timestamp :modified_at
    end
  end
end
