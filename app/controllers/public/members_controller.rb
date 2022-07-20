class Public::MembersController < ApplicationController
  before_action :authenticate_member!

  def show
    @member = member.find(params[:id])
  end
end
