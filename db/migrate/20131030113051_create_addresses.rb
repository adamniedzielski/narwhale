class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.string :first_line
      t.string :city
      t.string :postal_code
      t.string :second_line
      t.string :phone_number
      t.references :addressable, :polymorphic => true

      t.timestamps
    end
  end
end
