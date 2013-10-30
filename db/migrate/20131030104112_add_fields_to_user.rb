class AddFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :email, :string
    add_column :users, :password_hash, :string
    add_column :users, :registered, :boolean
    add_column :users, :nip, :string
  end
end
