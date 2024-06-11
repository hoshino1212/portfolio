class SmokingDataController < ApplicationController
    before_action :set_smoking_data, only: [:show, :edit, :update, :destroy]
  
    def index
      @smoking_data = SmokingData.all
    end
  
    def show
    end
  
    def new
      @smoking_data = SmokingData.new
    end
  
    def create
      @smoking_data = SmokingData.new(smoking_data_params)
      @smoking_data.user = current_user
  
      if @smoking_data.save
        redirect_to @smoking_data, notice: 'Smoking data was successfully created.'
      else
        render :new
      end
    end
  
    def edit
    end
  
    def update
      if @smoking_data.update(smoking_data_params)
        redirect_to @smoking_data, notice: 'Smoking data was successfully updated.'
      else
        render :edit
      end
    end
  
    def destroy
      @smoking_data.destroy
      redirect_to smoking_data_url, notice: 'Smoking data was successfully destroyed.'
    end
  
    private
  
    def set_smoking_data
      @smoking_data = SmokingData.find(params[:id])
    end
  
    def smoking_data_params
      params.require(:smoking_data).permit(:start_date, :cigarettes_per_day, :price_per_pack, :lifespan_increase_per_cigarette)
    end
  end
  