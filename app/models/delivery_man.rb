class DeliveryMan < ActiveRecord::Base

  has_many :packages_to_receive, :class_name => 'Package', :foreign_key => 'delivery_man_first_id'
  has_many :packages_to_deliver, :class_name => 'Package', :foreign_key => 'delivery_man_second_id'

  validate :symbol, :presence => true
end
