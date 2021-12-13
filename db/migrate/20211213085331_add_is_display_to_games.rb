class AddIsDisplayToGames < ActiveRecord::Migration[6.1]
  def change
    add_column :games, :is_display, :boolean
  end
end
