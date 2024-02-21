class EventsController < ApplicationController

  def index
    @events = Event.all
  end
  def show
    @event = Event.find(params[:id])
  end
  def new
    @event = Event.new
  end
  
  def create
    @event = current_user.events.build(event_params)
    @event.admin_id = current_user.id
    if @event.save
      redirect_to @event, notice: 'L\'événement a été créé avec succès.'
    else
      render :new
    end
  end
  
  private
  
  def event_params
    params.require(:event).permit(:start_date, :duration, :title, :description, :price, :location)
  end
end
