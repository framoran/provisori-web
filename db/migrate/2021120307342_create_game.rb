class CreateGame < ActiveRecord::Migration[6.1]
  def change
    create_table :game do |t|
      t.string :question
      t.integer :type_of_question
      t.string :src
      t.timestamp :created_at
      t.timestamp :modified_at
    end
  end
end
