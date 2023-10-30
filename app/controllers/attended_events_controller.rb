class AttendedEventsController < ApplicationController
  before_action :authenticate_user!, only: [ :new, :create ]
  def new
  end

  def create
    @attended_event = AttendedEvent.new(attended_event_params)
    if @attended_event.save
      redirect_to event_url(@attended_event.event_id)
    else
      redirect_to event_url(@attended_event.event_id), status: :unprocessable_entity
    end
  end

  private

  def attended_event_params
    params.require(:attended_event).permit(:user_id, :event_id)
  end
end
