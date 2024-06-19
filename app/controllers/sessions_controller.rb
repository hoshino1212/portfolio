class SessionsController < ApplicationController
  def create
    @user = login(params[:email], params[:password])
    if @user
      redirect_to user_path(@user), flash: { success: 'ログインしました' }
    else
      flash.now[:notice] = 'メールアドレスまたはパスワードが違います'
      render :new
    end
  end

  def destroy
    logout
    redirect_to root_path, flash: { success: 'ログアウトしました' }
  end
end
