class Public::HomesController < ApplicationController
  def top
    @itemes = Item.all.limit(4)
    @genres = Genre.all
  end
  
  def about
  end
end
