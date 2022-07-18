class Public::HomesController < ApplicationController
  def top
    @itemes = Item.all.limit(4)
  end
  
  def about
  end
end
