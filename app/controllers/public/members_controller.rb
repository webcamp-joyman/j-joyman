class Public::MembersController < ApplicationController
  before_action :authenticate_member!


  def show
    @member = current_member
  end

  def edit
    @member = current_member
  end
  
  def update
    member = current_member
    if member.update(member_params)
      redirect_to mypage_path
    else
      render :edit
    end
  end
     
  def unsubscribe
    
  end
  
  
  private
  
  def member_params
    params.require(:member).permit(:last_name, :first_name, :last_name_kana, :first_name_name, :post_code, :address, :call_number, :email)
  end
  

end
