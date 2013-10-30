class User < ActiveRecord::Base

  has_one :address, :as => :addressable
  has_many :sent_packages, :class_name => 'Package', :foreign_key => 'sender_id'
  has_many :received_packages, :class_name => 'Package', :foreign_key => 'receiver_id'
end
