class VenuesController < ApplicationController
  #before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :set_venue, only: [:destroy]
  def new
    @venue = current_user.venues.new
  end
  def index
    @venues = current_user.venues.all
  end
  def create
    @venue = current_user.venues.new(user_params)

    respond_to do |format|
      if @venue.save
        format.html { redirect_to root_path, notice: 'venue was successfully created.' }
        #format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @venue.destroy
    respond_to do |format|
      format.html { redirect_to venues_path, notice: 'venue was successfully destroyed.' }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_venue
    @venue = current_user.venues.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def user_params
    params.require(:venue).permit(:name, :info, :address,:city,:country,:state,:zip)
  end
end
