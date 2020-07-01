class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :password_digest, :bio, :profile_image, :summoner_name
end
