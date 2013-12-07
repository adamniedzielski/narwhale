class DeliveryManSerializer < ShortDeliveryManSerializer
  has_many :packages_to_receive, :embed => :ids
  has_many :packages_to_deliver, :embed => :ids
end
