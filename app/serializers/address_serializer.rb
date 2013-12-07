class AddressSerializer < ActiveModel::Serializer
  attributes :id, :first_line, :city, :postal_code, :second_line, :phone_number
end
