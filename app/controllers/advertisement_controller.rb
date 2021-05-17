class AdvertisementController < ApplicationController
  before_action :require_logged_in_admin
  before_action :set_advertisement, only: [:show, :edit, :update, :destroy]
  # GET /advertisements
  def index
    @advertisements = Advertisement.all
  end

  # GET /advertisements/1
  def show
  end

  # GET /advertisements/new
  def new
    @advertisement = Advertisement.new
  end

  # GET /advertisements/1/edit
  def edit
    @advertisement = Advertisement.find_by(:id => params[:id])
  end

  # POST /advertisements
  def create
    @advertisement = Advertisement.new(advertisement_params)

    if @advertisement.save
      redirect_to @advertisement, notice: 'Advertisement was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /advertisements/1
  def update
    advert = Advertisement.find_by(:id => params[:id])
    params.delete(:id)
    if advert.update(advertisement_params)
      redirect_to @advertisement, notice: 'Advertisement was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /advertisements/1
  def destroy
    @advertisement = Advertisement.destroy_by(:id => params[:id])
    redirect_to advertisements_url, notice: 'Advertisement was successfully destroyed.'
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_advertisement
    @advertisement = Advertisement.find(params[:id])
  end

  # Only allow a trusted parameter "white list" through.
  def advertisement_params
    params.permit(:title, :content, :tag)
  end
end
