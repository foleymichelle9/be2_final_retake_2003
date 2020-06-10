class SurgeriesController < ApplicationController
  def index
    @surgeries = Surgery.all
  end

  def show
    @surgery = Surgery.find(params[:id])
  end

  def new

  end

  def create
    Surgery.create(surgery_params)
    redirect_to '/surgeries'
  end

  def update
    @surgery = Surgery.find(params[:id])
    #require "pry"; binding.pry
    @surgery.doctors.find_by(id: params[:id])
    #DoctorSurgery.create(doctor_id: @doctor.id, surgery_id: @surgery.id)
    redirect_to "/surgeries/#{@surgery.id}"
  end
end



  private
  def surgery_params
    params.permit(:title, :day, :room)
  end
