class Package < ActiveRecord::Base
  
  belongs_to :sender, :class_name => 'User'
  belongs_to :receiver, :class_name => 'User'
  belongs_to :delivery_man_first, :class_name => 'DeliveryMan'
  belongs_to :delivery_man_second, :class_name => 'DeliveryMan'
  has_one :sender_address, -> { where :category => 'sender' },
          :class_name => 'Address', :as => :addressable
  has_one :receiver_address, -> { where :category => 'receiver' },
          :class_name => 'Address', :as => :addressable
end
