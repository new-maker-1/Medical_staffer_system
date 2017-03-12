class EventsController < ApplicationController
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  def index
    @events = Event.where(start: params[:start]..params[:end])
  end

  def show
  end

  def new
    @event = Event.new
    @providers=Provider.all
    @sites=Site.all
  end

  def edit
    @event=Event.find(params[:id])
    @providers=Provider.all
    @sites=Site.all
  end

  def create
    @event = Event.new(event_params)
    @event.save
    @providers=Provider.all
    @sites=Site.all
  end

  def update
    @event.update(event_params)
    @providers=Provider.all
    @sites=Site.all
  end

  def destroy
    @event.destroy
  end

  private
    def set_event
      @event = Event.find(params[:id])
    end

    def event_params
      params.require(:event).permit(:provider_id,:site_id,:title, :date_range, :start, :end,:status,:hide_from_schedule,:custom_pay_rate,:custom_bill_rate,:area,:note,:filledon,:access_id,:last_modified_by_x_on_y, :color)
    end
end
