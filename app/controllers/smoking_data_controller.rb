class SmokingDataController < ApplicationController
  before_action :set_user
  before_action :set_smoking_data, only: [:edit, :update, :destroy]

  def new
    @smoking_data = @user.smoking_data.build
  end

  def create
    @smoking_data = @user.smoking_data.build(smoking_data_params)
    if @smoking_data.save
      redirect_to user_path(@user), notice: '喫煙データが登録されました。'
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @smoking_data.update(smoking_data_params)
      redirect_to user_path(@user), notice: '喫煙データが更新されました。'
    else
      render :edit
    end
  end

  def destroy
    @smoking_data.destroy
    redirect_to user_path(@user), notice: '喫煙データが削除されました。'
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_smoking_data
    @smoking_data = @user.smoking_data.find(params[:id])
  end

  def smoking_data_params
    params.require(:smoking_data).permit(:cigarettes_per_day, :price_per_pack, :lifespan_increase_per_cigarette, :start_date)
  end
end
