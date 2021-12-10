class CreateShares < ActiveRecord::Migration[6.1]
  def change
    create_table :shares do |t|
      t.references :article, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :share
      t.timestamp :created_at
      t.timestamp :modified_at
    end
  end
end
