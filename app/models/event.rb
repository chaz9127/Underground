class Event < ApplicationRecord
  VALID_EVENT_TYPES = ['normal', 'special']

  has_many :tickets

  validates :event_type, presence: true
  validates :event_type, inclusion: { in: VALID_EVENT_TYPES }

  def serialized
    {
      id: id,
      event_type: event_type,
      description: description,
      created_at: created_at,
      updated_at: updated_at
    }
  end
end
