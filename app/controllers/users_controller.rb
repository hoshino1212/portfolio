class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user), notice: 'ユーザー登録が完了しました。'
    else
      render :new
    end
  end

  def show
    @smoking_data = @user.smoking_data
    @smoke_free_duration = calculate_smoke_free_duration
    @cigarettes_not_smoked = calculate_cigarettes_not_smoked
    @money_saved = calculate_money_saved
    @life_extended = calculate_life_extended
  end

  def edit
  end

  def update
    if @user.update(user_params)
      redirect_to user_path(@user), notice: 'ユーザー情報が更新されました。'
    else
      render :edit
    end
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :reminder_time, :start_date, :cigarettes_per_day, :price_per_pack, :lifespan_increase_per_cigarette)
  end

  def calculate_smoke_free_duration
    return 0 unless @user.start_date
    Time.zone.now - @user.start_date
  end

  def calculate_cigarettes_not_smoked
    return 0 unless @smoking_data && @user.start_date
    (@smoke_free_duration / 1.day) * @smoking_data.cigarettes_per_day
  end

  def calculate_money_saved
    return 0 unless @smoking_data && @user.start_date
    @cigarettes_not_smoked * (@smoking_data.price_per_pack / 20)
  end

  def calculate_life_extended
    return 0 unless @smoking_data && @user.start_date
    @cigarettes_not_smoked * @smoking_data.lifespan_increase_per_cigarette
  end
end
