class CreateElements < ActiveRecord::Migration[6.1]
  def change
    create_table :elements do |t|
      t.references :article, foreign_key: true
      t.string :elements_type, :default => 'null'
      t.string :subtitle1, :default => 'null'
      t.string :subtitle2, :default => 'null'
      t.string :body, :default => 'null'
      t.string :src, :default => 'null'
      t.string :alt, :default => 'null'
      t.timestamp :created_at
      t.timestamp :modified_at
    end
  end
end
