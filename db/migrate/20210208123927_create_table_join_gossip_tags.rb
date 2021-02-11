class CreateTableJoinGossipTags < ActiveRecord::Migration[6.1]
  def change
    create_table :table_join_gossip_tags do |t|
      t.belongs_to :gossip
      t.belongs_to :tag

      t.timestamps
    end
  end
end
