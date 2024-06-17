class SessionsController < ApplicationController
  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to user_path(@user), notice: 'ログインしました。'
    else
      flash.now[:alert] = 'メールアドレスまたはパスワードが違います。'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, status: :see_other
  end
end
