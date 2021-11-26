class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy]

  def index
    @reservations = Reservation.all
  end

  def create
    @event = Event.find(params[:event_id])
    @reservation = Reservation.new
    authorize @reservation
    @reservation.user = current_user
    @reservation.event = @event

    if @reservation.save
      redirect_to event_path(@event), notice: 'Congrats! You have joined the event.'
    else
      redirect_to event_path(@event), notice: 'You have already joined.'
    end

  end

  def new
    @event = event.find(params[:event_id])
    @reservation = reservation.new
    authorize @reservation
  end

  def edit
  end

  def show
  end

  def update
    if @reservation.update
      redirect_to @reservation, notice: 'reservation was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @reservation.destroy
    redirect_to events_path, notice: 'reservation was successfully destroyed.'
  end

private
  def set_reservation
    @reservation = reservation.find(params[:id])
    authorize @reservation
  end

  # def reservation_params
  #   @reservation.user = current_user
  #   @reservation_params = params.require(:reservation).permit(:user_id, :event_id)
  # end
end
