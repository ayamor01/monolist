class Item < ActiveRecord::Base
  serialize :raw_info , Hash

  has_many :ownerships  , foreign_key: "item_id" , dependent: :destroy
  has_many :users , through: :ownerships
  
  has_many :wants, class_name: "Want", foreign_key: "item_id", dependent: :destroy
  has_many :want_users, through: :wants, source: :user
  has_many :haves, class_name: "Have", foreign_key: "item_id", dependent: :destroy
  has_many :have_users, through: :haves, source: :user
  
  scope :want_top10, ->{
    select("items.*, count(user_id) AS want_count").
    joins(:wants).
    group("item_id").
    order("want_count DESC").
    limit(10)
  }
    
  scope :have_top10, ->{
    select("items.*, count(user_id) AS have_count").
    joins(:haves).
    group("item_id").
    order("have_count DESC").
    limit(10)
  }

end
