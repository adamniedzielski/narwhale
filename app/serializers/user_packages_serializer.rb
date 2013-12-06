class UserPackagesSerializer < ActiveModel::Serializer
  
  has_many :sent_packages
  has_many :received_packages

end