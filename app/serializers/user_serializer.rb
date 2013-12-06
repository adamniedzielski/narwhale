class UserSerializer < ActiveModel::Serializer
  
  attributes :id, :first_name, :last_name, :email, :registered, :nip
  has_one :address

end
