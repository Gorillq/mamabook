class ReserveForm
  include ActiveModel::Model

  attr_accessor :first_name, :last_name, :email, :date_arrival, :date_departure

  validates :first_name, :last_name, :email, :date_arrival, :date_departure, presence: true
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
  validate :validate_date_range

  private

  def validate_date_range
    if date_arrival.present? && date_departure.present?
      errors.add(:date_departure, "must be after the arrival date") if date_arrival >= date_departure
    end
  end
end
