class LocationsController < ApplicationController
  before_action :set_location, only: %i[show edit update destroy]

  def index
    @locations = LocationQuery.index
  end

  def search
    @locations = LocationsServices::Search.new(params).call

    render 'index'
  end

  def show; end

  def new
    @location = Location.new
  end

  def edit; end

  def create
    @location = Location.new(location_params)

    respond_to do |format|
      if @location.save
        format.html { redirect_to location_url(@location), notice: 'Location was successfully created.' }
        format.json { render :show, status: :created, location: @location }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @location.update(location_params)
        format.html { redirect_to location_url(@location), notice: 'Location was successfully updated.' }
        format.json { render :show, status: :ok, location: @location }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @location.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @location.destroy

    respond_to do |format|
      format.html { redirect_to locations_url, notice: 'Location was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_location
    @location = Location.find(params[:id])
  end

  def location_params
    params.require(:location).permit(:title,
                                   :content,
                                   :opened,
                                   :mask,
                                   :towel,
                                   :fountain,
                                   :locker_room,
                                   schedule_attributes: %i[
                                     week_days
                                     hour
                                   ])
  end
end
