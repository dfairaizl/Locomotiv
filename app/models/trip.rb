class Trip
  include Mongoid::Document

  field :route_id, type: String
  field :service_id, type: String
  field :trip_id, type: String
  field :trip_headsign, type: String
  field :trip_short_name, type: String
  field :direction_id, type: String
  field :block_id, type: String
  field :shape_id, type: String
  field :wheelchair_boarding, type: String

  index({ trip_id: 1 })

  has_many :stop_times

  belongs_to :route
end
