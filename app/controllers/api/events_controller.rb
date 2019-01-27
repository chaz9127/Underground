module Api
  class EventsController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def create
      begin
        ActiveRecord::Base.transaction do
          event = Event.create!(
            name: create_params[:name],
            event_type: create_params[:event_type],
            description: create_params[:description],
            start_date: create_params[:start_date]
          )

          create_params[:tickets].each do |ticket|
            if ticket[:name].present?
              Ticket.create!(
                price: ticket[:price].to_f * 100,
                name: ticket[:name],
                event_id: event.id
              )
            end
          end
          
          render json: { event: event.serialized }, status: :created
        end
      rescue => exception
        render json: { errors: { events_error: exception.to_s }  }, status: :internal_server_error
      end
    end

    def index
      begin
        events = Event.order(start_date: :desc)

        if index_params[:latest]
          events = [events.last]
        end

        render json: { events: events.map(&:serialized) }, status: :created
      rescue => exception
        render json: { errors: { events_error: exception.to_s }  }, status: :internal_server_error
      end
    end

    def create_params
      params.
        require(:event).
        permit(
          :start_date,
          :event_type,
          :description,
          :name,
          tickets: [:name, :price]
        )
    end

    def index_params
      params.permit(
        :latest
      )
    end
  end
end