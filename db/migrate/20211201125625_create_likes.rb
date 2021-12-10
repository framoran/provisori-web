class CreateLikes < ActiveRecord::Migration[6.1]
  def change
    create_table :likes do |t|
      t.references :article, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :like
      t.timestamp :created_at
      t.timestamp :modified_at
    end
  end
end
