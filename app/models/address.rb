class Address < ActiveRecord::Base

  belongs_to :addressable, :polymorphic => true

  validates_presence_of :first_line, :city, :phone_number, :postal_code, :addressable
end
