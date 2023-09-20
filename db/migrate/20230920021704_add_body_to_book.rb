class AddBodyToBook < ActiveRecord::Migration[6.1]
  def change
    add_column :books, :boby, :string
  end
end
