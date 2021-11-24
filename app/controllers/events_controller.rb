class EventsController < ApplicationController

  # GET /events or /events.json
  def index
    @events = Event.all
    @events = @events.sort_by { |event| event.time }
  end

  # GET /events/1 or /events/1.json
  def show
    @event = Event.find(params[:id])
  end

  # GET /events/new
  def new
    @event = Event.new
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user

    if @event.save
      redirect_to root_path
    else
      render :new
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end


  # PATCH/PUT /events/1 or /events/1.json
  def update
    @event = Event.find(params[:id])

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

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :description, :limit, :time)
    end

    def invalid_event
      logger.error "Attempt to access invalid event #{params[:id]}"
      redirect_to events_index_url, notice: 'Invalid event'
    end

end
