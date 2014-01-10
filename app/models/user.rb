
require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt

  has_one :address, :as => :addressable
  has_many :sent_packages, :class_name => 'Package', :foreign_key => 'sender_id'
  has_many :received_packages, :class_name => 'Package', :foreign_key => 'receiver_id'

  validates_presence_of :first_name, :last_name, :email
  validate :email, :uniqueness => true

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
