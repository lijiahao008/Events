class EventsController < ApplicationController

	before_action :set_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :search]

  def search
    if params[:search].present?
      @events = Event.search(params[:search])
    else
      @events = Event.all
    end
  end

  def my_events
    unless current_user.profile == nil
      @my_events = Event.where(profile_id: current_user.profile.id).order("created_at DESC")
    end
  end

  def index
    @events = Event.all
  end

	def new
		if current_user.profile == nil
  		flash[:notice] = 'You can not create a event because you do not have a profile yet'
  		redirect_to profiles_path
  	else
			@event = Event.new
      @categories = Category.all
		end
	end

	def create
  	
 		@event =  Event.create(event_params)
 		@event.profile_id = current_user.profile.id


  	if @event.save
  		redirect_to profile_path(@event.profile_id)
  	end
	end

	def show
    @reviews = Review.where(event_id: @event.id)
	end

  def edit
    @categories = Category.all
  end

  def update
    if @event.update(event_params)
      redirect_to event_path(@event)
    end
  end

	def destroy

	end


  	private


  	def set_event
  		@event = Event.find(params[:id])
  	end

  	def event_params
      params.require(:event).permit(:title, :description, :time, :location, :category_ids => [])
    end
end
