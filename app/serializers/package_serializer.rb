class PackageSerializer < ActiveModel::Serializer
  attributes :id, :category, :charge_amount, :insurance, :info, :token, :status
  has_one :sender
  has_one :receiver
  has_one :delivery_man_first
  has_one :delivery_man_second
end
