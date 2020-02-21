class UsersProfiles < ActiveRecord::Migration[5.2]
  def change
    create_table :users_profiles do |up|
      up.integer :user_id
      up.integer:profile_id
    end
  end
end
