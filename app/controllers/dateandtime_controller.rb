class DateandtimeController < ApplicationController
  def index
    @reserve_form = ReserveForm.new
    @date = Date.today
  end

  def create_event
    @reserve_form = ReserveForm.new(reserve_form_params)
    if @reserve_form.save
      Rails.logger.info("Stworzono rezerwacje dla #{@reserve_form.first_name} #{@reserve_form.last_name} od #{@reserve_form.date_arrival} do #{@reserve_form.date_departure}")
      render json: { success: true, message: "Reservation processed successfully" }
    else
      render json: { success: false, errors: @reserve_form.errors.full_messages }, status: :unprocessable_entity
    end
  end

  private

  def reserve_form_params
    params.require(:reserve_form).permit(:first_name, :last_name, :email, :date_arrival, :date_departure)
  end
end
