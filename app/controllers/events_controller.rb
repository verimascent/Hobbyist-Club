class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :edit, :destroy]
  # GET /events or /events.json
  def index
    @events = policy_scope(Event)
    @events = @events.sort_by { |event| event.time }
    @formatted_time = "%a, %b %d @ %I:%M %p"
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

    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      authorize @event
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require(:event).permit(:name, :description, :limit, :time)
    end

    def invalid_event
      logger.error "Attempt to access invalid event #{params[:id]}"
      redirect_to events_index_url, notice: 'Invalid event'
    end

end
