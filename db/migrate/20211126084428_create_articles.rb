class CreateArticles < ActiveRecord::Migration[6.1]
  def change
    create_table :articles do |t|
      t.string :title
      t.string :body
      t.string :view
      t.timestamp :created_at
      t.timestamp :modified_at
    end
  end
end
