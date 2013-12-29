class StopTime
  include Mongoid::Document

  field :trip_id, type: String
  field :arrival_time, type: Time
  field :departure_time, type: Time
  field :stop_id, type: String
  field :stop_sequence, type: String
  field :pickup_type, type: String
  field :drop_off_type, type: String

  belongs_to :trip
end
