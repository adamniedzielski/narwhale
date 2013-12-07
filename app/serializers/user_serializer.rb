class UserSerializer < ShortUserSerializer 
  attributes :email, :registered, :nip
  has_one :address
end
