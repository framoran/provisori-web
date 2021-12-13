class CreateWinners < ActiveRecord::Migration[6.1]
  def change
    create_table :winners do |t|
      t.references :game, foreign_key: true
      t.references :user, foreign_key: true
      t.integer :week
      t.integer :year
      t.timestamp :created_at
      t.timestamp :modified_at
    end
  end
end
