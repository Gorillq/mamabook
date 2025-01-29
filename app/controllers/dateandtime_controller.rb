class DateandtimeController < ApplicationController
  def index
    @date = Date.today
  end
  def create_event
    @date = params[:date]
    #booking
    #
    Rails.logger.info("Stworzono rezerwacje #{date}")
    render json: {success: true}
  end
end
