class UserPackagesSerializer < ActiveModel::Serializer
  
  has_many :sent_packages, :serializer => ShortPackageSerializer
  has_many :received_packages, :serializer => ShortPackageSerializer

end