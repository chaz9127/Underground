module Api
  class CustomerPurchasesController < ActionController::Base
    skip_before_action :verify_authenticity_token

    def create
      begin
        ActiveRecord::Base.transaction do
          event = Event.find(create_params[:event_id])
          raise "Event with the id (#{create_params[:event_id]}) can not be found" if event.nil?

          customer = Customer.create({
            first_name: create_params[:first_name],
            last_name: create_params[:last_name],
            email: create_params[:email],
            returning: create_params[:customer_type] == 'returning'
          })

          purchase = CustomerPurchase.create({
            customer_id: customer.id,
            ticket_id: create_params[:ticket_id]
          })

          render json: { customer_purchase: purchase.serialized }, status: :created
        end
      rescue => exception
        render json: { errors: { customer_purchase_error: exception.to_s }  }, status: :internal_server_error
      end
    end

    def create_params
      params.
        require(:customer_purchase).
        permit(
          :ticket_id,
          :first_name,
          :last_name,
          :event_id,
          :customer_type,
          :email
        )
    end
  end
end