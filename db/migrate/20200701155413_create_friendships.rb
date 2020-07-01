class CreateFriendships < ActiveRecord::Migration[6.0]
  def change
    create_table :friendships do |t|
      t.user :belongs_to

      t.timestamps
    end
  end
end
