class AddCategoryToAddress < ActiveRecord::Migration
  def change
    add_column :addresses, :category, :string
  end
end
