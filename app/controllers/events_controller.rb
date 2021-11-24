class EventsController < ApplicationController
  before_action :set_event, only: [:show, :update, :edit, :destroy]
  # GET /events or /events.json
  def index
    @events = policy_scope(Event)
  end

  # GET /events/1 or /events/1.json
  def show
  end

  # GET /events/new
  def new
    @event = Event.new
    authorize @event
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events or /events.json
  def create
    @event = Event.new(event_params)
    @event.user = current_user
    authorize @event
    @event.save
    redirect_to action: :index
    # respond_to do |format|
    #   if @event.save
    #     # format.html { redirect_to @event, notice: "Event was successfully created." }
    #     # format.json { render :show, status: :created, location: @event }
    #     redirect_to action: :index
    #   else
    #     format.html { render :new, status: :unprocessable_entity }
    #     format.json { render json: @event.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # PATCH/PUT /events/1 or /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: "Event was successfully updated." }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1 or /events/1.json
  def destroy
    @event.destroy if @event.id == session[:event_id]
    session[:event_id] = nil
    respond_to do |format|
      format.html { redirect_to store_index_url, notice: "Event was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
      authorize @event
    end

    # Only allow a list of trusted parameters through.
    def event_params
      params.require('event').permit('name', 'description', 'limit', 'time', 'user_id')
      # params.fetch(:event, {})
    end

    def invalid_event
      logger.error "Attempt to access invalid event #{params[:id]}"
      redirect_to events_index_url, notice: 'Invalid event'
    end

end
