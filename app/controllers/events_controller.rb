class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :edit, :destroy]
  skip_before_action :authenticate_user!, only: :index

  # GET /events or /events.json
  def index
    @events = policy_scope(Event)
    @formatted_time = "%a, %b %d @ %I:%M %p"

    if params[:query].present?
      sql_query = "name ILIKE :query OR description ILIKE :query"
      @events = Event.where(sql_query, query: "%#{params[:query]}%")
    else
      @events = Event.all
    end

    @events = @events.sort_by { |event| [event.date, event.start_time] }
  end

  # GET /events/1 or /events/1.json
  def show
    # the `geocoded` scope filters only flats with coordinates (latitude & longitude)
    @event = Event.find(params[:id])
    @marker = {
        lat: @event.latitude,
        lng: @event.longitude,
        info_window: render_to_string(partial: "info_window", locals: { event: @event }),
        image_url: helpers.asset_url("vector.svg")
      }
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
      params.require(:event).permit(:name, :description, :limit, :date, :start_time, :end_time, :address, :img_url)
    end

    def invalid_event
      logger.error "Attempt to access invalid event #{params[:id]}"
      redirect_to events_index_url, notice: 'Invalid event'
    end

end
