class CreatePackages < ActiveRecord::Migration
  def change
    create_table :packages do |t|
      t.integer :category
      t.decimal :charge_amount
      t.decimal :insurance
      t.text :info
      t.string :token
      t.string :status
      t.references :sender, index: true
      t.references :receiver, index: true
      t.references :delivery_man_first, index: true
      t.references :delivery_man_second, index: true

      t.timestamps
    end
  end
end
