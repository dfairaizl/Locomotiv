class Stop
  include Mongoid::Document

  field :stop_id, type: String
  field :stop_code, type: String
  field :stop_name, type: String
  field :stop_desc, type: String
  field :stop_lat, type: String
  field :stop_lon, type: String
  field :zone_id, type: String
  field :stop_url, type: String
  field :location_type, type: String
  field :parent_station, type: String
  field :wheelchair_accessible, type: String
end
