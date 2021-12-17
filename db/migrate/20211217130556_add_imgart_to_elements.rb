class AddImgartToElements < ActiveRecord::Migration[6.1]
  def change
    add_column :elements, :imgart, :string
  end
end
