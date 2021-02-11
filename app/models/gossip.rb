class Gossip < ApplicationRecord
    validates :title, 
    presence: true,
    length: { in: 3..14 }
    
    validates :content, presence: true

    belongs_to :user
    has_many :TableJoinGossipTags
    has_many :tags, through: :TableJoinGossipTags
    has_many :comments, dependent: :destroy
    has_many :likes, dependent: :destroy
end
