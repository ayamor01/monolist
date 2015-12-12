class AddRankingToItems < ActiveRecord::Migration
  def change
    add_column :items, :want_users_count, :integer
    add_column :items, :have_users_count, :integer
  end
end
