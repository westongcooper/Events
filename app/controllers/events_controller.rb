class EventsController < ApplicationController
  # before_action :require_user, only: [:new]
  before_action :set_event, only: [:destroy,:edit,:update]
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
    redirect_to :back, notice: "you are attending #{Event.find(params[:id]).name}"
  end
  def show
    @event = Event.find(params[:id])
    @venue = @event.venue
  end
  def edit
    @venues = current_user.venues
  end
  def unattend
    Attendance.where(user_id: current_user.id).where(event_id:params[:id]).take.destroy
    redirect_to :back, notice: "you are not attending #{Event.find(params[:id]).name} anymore"
  end
  def create
    respond_to do |format|
      if event = current_user.events.create(event_params)
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
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to root_path, notice: 'event was successfully updated.' }
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
    params.require(:event).permit(:name, :description, :start_date,:end_date,:end_time,:venue_id)
  end
end
