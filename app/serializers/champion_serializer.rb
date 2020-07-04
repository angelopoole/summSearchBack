class ChampionSerializer < ActiveModel::Serializer
  attributes :id, :name, :title, :blurb, :image, :tags
end
