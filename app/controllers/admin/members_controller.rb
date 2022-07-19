class Admin::MembersController < ApplicationController
  #before_action :authenticate_admin!

  def index
    @members = Member.page(params[:page])
  end

end
