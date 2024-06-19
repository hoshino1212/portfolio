class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_smoking_data, only: [:edit, :update]

  def new
    @user = User.new
  end

  def name
    username
  end

  def create
    @user = User.new(user_params)
    if @user.save
      log_in @user
      redirect_to user_path(@user), flash: { success: 'ユーザー登録が完了しました' } 
    else
      render :new
    end
  end

  def show
    @user = User.find(params[:id])
    @smoking_data = @user.smoking_data || @user.build_smoking_data
    @smoke_free_duration = calculate_smoke_free_duration
    @cigarettes_not_smoked = calculate_cigarettes_not_smoked
    @money_saved = calculate_money_saved
  end
  

  def edit
    @user = User.find(params[:id])
    @smoking_data = @user.smoking_data || @user.build_smoking_data
  end

  def update
    if @user.update(user_params)
      # ユーザー情報が更新された後に、smoking_data の更新を試みる
      if @user.smoking_data.update(smoking_data_params)
        redirect_to user_path(@user), flash: { success: 'ユーザー情報を更新しました' } 
      else
        render :edit
      end
    else
      render :edit
    end
  end
  

  def destroy
    @user.destroy
    redirect_to users_path, notice: 'ユーザーが削除されました。'
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def set_smoking_data
    @smoking_data = @user.smoking_data || @user.build_smoking_data
  end

  def smoking_data_params
    params.require(:user).require(:smoking_data_attributes).permit(:start_date, :cigarettes_per_day, :price_per_pack)
  end

  def user_params
    params.require(:user).permit(:username, :email, :reminder_time, :start_date,
                                 :password, :password_confirmation,
                                 smoking_data_attributes: [:id, :start_date, :cigarettes_per_day, :price_per_pack])
  end  

  def calculate_smoke_free_duration
    return 0 unless @user.start_date
    Time.zone.now - @user.start_date
  end

  def calculate_cigarettes_not_smoked
    return 0 unless @smoking_data&.cigarettes_per_day && @user.start_date
    (@smoke_free_duration / 1.day).to_i * @smoking_data.cigarettes_per_day
  end

  def calculate_money_saved
    return 0 unless @smoking_data&.price_per_pack && @smoking_data&.cigarettes_per_day
    @cigarettes_not_smoked * (@smoking_data.price_per_pack / 20)
  end
end
