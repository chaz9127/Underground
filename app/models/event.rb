class Event < ApplicationRecord
  VALID_EVENT_TYPES = ['regular', 'special']

  has_many :tickets, dependent: :destroy

  validates :event_type, presence: true
  validates :event_type, inclusion: { in: VALID_EVENT_TYPES }

  def serialized
    {
      id: id,
      event_name: name,
      event_type: event_type,
      description: description,
      tickets: tickets.map(&:serialized),
      start_date: start_date,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
