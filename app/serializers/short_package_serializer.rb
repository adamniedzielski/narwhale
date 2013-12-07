class ShortPackageSerializer < ActiveModel::Serializer
  attributes :id, :category, :charge_amount, :insurance, :info, :token, :status
end
