class AddNbAttempsToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :nb_attempts, :integer, :default => 0
  end
end
