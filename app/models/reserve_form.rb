class ReserveForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :email, :date_arrival, :date_departure

  validates :first_name, :last_name, :email, :date_arrival, :date_departure, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :validate_date_range

  def perform_save
    if valid?
      Reservation.create(
        first_name: first_name,
        last_name: last_name,
        email: email,
        date_arrival: date_arrival,
        date_departure: date_departure
      )
    else
      Rails.logger.error("Failed to save reservation: #{errors.full_messages.join(', ')}")
      false
    end
  end

  private

  def validate_date_range
    if date_arrival && date_departure
      errors.add(:date_departure, "must be after the arrival date") if date_arrival >= date_departure
    end
  end
end
