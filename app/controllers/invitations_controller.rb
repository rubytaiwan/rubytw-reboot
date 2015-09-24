class InvitationsController < ApplicationController
  def create
    invitation = Invitation.new(model_param)

    if invitation.create_and_send
      redirect_to(root_path, notice: "邀請信已經送到您的信箱囉！很期待見到你！")
    else
      redirect_to(root_path, alert: "唉呦！出錯了... #{invitation.errors.full_messages}")
    end
  end

  private

  def model_param
    params.require(:invitation).permit(:email)
  end
end
