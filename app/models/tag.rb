class Tag < ApplicationRecord
  has_many :TableJoinGossipTags
  has_many :gossips, through: :TableJoinGossipTags
end
