class RemoveRankingFromItems < ActiveRecord::Migration
  def change
    remove_column :items, :want_users_count, :integer
    remove_column :items, :have_users_count, :integer
  end
end
