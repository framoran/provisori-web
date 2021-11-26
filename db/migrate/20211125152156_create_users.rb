class CreateUsers < ActiveRecord::Migration[6.1]
  def change
    create_table :users do |t|
      t.string :name
      t.string :last_name
      t.string :email
      t.string :password_digest
      t.integer :response_game
      t.timestamp :created_at
      t.timestamp :modified_at
    end
  end
end
