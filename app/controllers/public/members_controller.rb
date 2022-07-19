class Public::MembersController < ApplicationController
  #before_action :authenticate_member!
  #before_action :ensure_correct_member

  def  unsubscribe
    @member = Member.find(params[:id])
    #会員の情報を見つける
  end
  
  def  withdraw
    @member = Member.find(current_user.id)
    #現在ログインしている会員を@memberに格納
    @member.update(is_valid: "Invalid")
    #updateで登録情報をInvalidに変更
    reset_session
    #sessionIDのresetを行う
    redirect_to root_path
    #指定されたrootへのpath
  end
  
  #private
  
  #def  member_params
    #params.require(:member)
  #end
end
