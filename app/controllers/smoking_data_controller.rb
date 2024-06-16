class SmokingDataController < ApplicationController
  before_action :set_user
  before_action :set_smoking_data, only: [:edit, :update, :destroy]

  def new
    @smoking_data = @user.smoking_data.build
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end

  def set_smoking_data
    @smoking_data = @user.smoking_data.find(params[:id])
  end

  def smoking_data_params
    params.require(:smoking_data).permit(:cigarettes_per_day, :price_per_pack, :start_date)
  end  
end
