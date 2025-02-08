class DateandtimeController < ApplicationController
  def index
    @date = Date.today
  @reserve_form = ReserveForm.new
  end
  def reze
  end

def create_event
  user_params = params.require(:first_name, :last_name, :email, :date_arrival, :date_departure)
  @reserve_form = ReserveForm.new(user_params)
  Rails.logger.debug "Reserve Form Params: #{reserve_form_params.inspect}"
  Rails.logger.debug "Reserve Form Valid: #{@reserve_form.valid?}"
  Rails.logger.debug "Reserve Form Errors: #{@reserve_form.errors.full_messages.join(', ')}"

  if @reserve_form.perform_save
    redirect_to action: "reze", notice: "Reservation processed successfully"
  else
    redirect_to "errors/warn", status: :unprocessable_entity
  end
end

  private

  def reserve_form_params
     params.require(:reserve_form).permit(:first_name, :last_name, :email, :date_arrival, :date_departure)
  end
end
