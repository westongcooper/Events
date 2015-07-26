class EventsController < ApplicationController
  # before_action :require_user, only: [:new]
  before_action :set_event, only: [:destroy]
  def index
    @events = current_user.attendances.where(admin:false).limit(25)
    @is_admin = Attendance.where(user_id:current_user.id).where(admin:true)
    @admin_events =  current_user.attendances.where(admin:true)
  end
  def new
    @event = current_user.events.new
    @venues = current_user.venues
  end
  def attend
    Attendance.create(user_id: current_user.id,event_id:params[:id])
    redirect_to :back, notice: "you are attending #{params[:id]}"
  end
  def show
    @event = Event.find(params[:id])
    @venue = @event.venue
  end
  def unattend
    Attendance.where(user_id: current_user.id).where(event_id:params[:id]).take.destroy
    redirect_to :back, notice: "you are not attending #{Event.where(id:params[:id]).name} anymore"
  end
  def create
    event = current_user.events.new(event_params)
    respond_to do |format|
      if current_user.save
        attending = Attendance.where(user_id:current_user.id).where(event_id:event.id).take
        attending.admin = true
        attending.save
        format.html { redirect_to root_path, notice: 'event was successfully created.' }
        #format.json { render :show, status: :created, location: @user }
      else
        format.html { render :new }
        #format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_path, notice: 'Event was successfully destroyed.' }
    end
  end

  def set_event
    @event = current_user.events.find(params[:id])
  end

  private
  def event_params
    params.require(:event).permit(:name, :description, :start_date,:end_date,:end_time,:venue_id,:image)
  end
end
