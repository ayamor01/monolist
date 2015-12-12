class RankingController < ApplicationController

    def want
        @want_ranking_items = Item.want_top10
    end
    
    def have
        @have_ranking_items = Item.have_top10
    end

end
