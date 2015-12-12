class RankingController < ApplicationController

    def want
        @top_10 = Item.find(:all, :order, => "want_users.count DESC" )
    end
    
    def have
        @top_10 = Item.find(:all, :order => "have_users.count DESC" )
    end

end
