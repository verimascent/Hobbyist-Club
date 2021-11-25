class ProfileController < ApplicationController
  before_action :set_event, only: [:show, :update, :edit, :destroy]

  def index
    @events = policy_scope(Event)
    @events = @events.sort_by { |event| [event.date, event.start_time] }
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    authorize @event
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  # GET /events/1/edit
  def edit
  end


  # PATCH/PUT /events/1 or /events/1.json
  def update
    if @event.update(event_params)
      redirect_to @event
    else
      render :edit
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    redirect_to root_path
  end

  private

  def set_event
    @event = Event.find(params[:id])
    authorize @event
  end

  def event_params
    params.require(:event).permit(:name, :description, :limit, :date, :start_time, :end_time, :address, :img_url)
  end

end
