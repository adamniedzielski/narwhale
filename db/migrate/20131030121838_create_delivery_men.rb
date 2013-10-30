class CreateDeliveryMen < ActiveRecord::Migration
  def change
    create_table :delivery_men do |t|
      t.string :symbol

      t.timestamps
    end
  end
end
