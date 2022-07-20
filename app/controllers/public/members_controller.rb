class Public::MembersController < ApplicationController
  before_action :authenticate_member!


  def show
    @member = current_member
  end

  private



end
