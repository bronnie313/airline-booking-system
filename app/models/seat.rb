class Seat < ApplicationRecord
  belongs_to :flight

  validate :validate_baggage_allowance

  private

  def validate_baggage_allowance
    errors.add(:base, 'You have too much baggage') if baggage > flight.baggage_allowance
    return unless flight.seats.size >= flight.capacity

    errors.add(:base, 'The flight is fully booked')
  end
end
