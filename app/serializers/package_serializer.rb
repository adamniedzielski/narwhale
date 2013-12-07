class PackageSerializer < ShortPackageSerializer
  has_one :sender, :serializer => ShortUserSerializer
  has_one :receiver, :serializer => ShortUserSerializer
  has_one :delivery_man_first, :serializer => ShortDeliveryManSerializer
  has_one :delivery_man_second, :serializer => ShortDeliveryManSerializer
  has_one :sender_address
  has_one :receiver_address
end
