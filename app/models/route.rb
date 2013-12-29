class Route
  include Mongoid::Document

  field :route_id, type: String
  field :agency_id, type: String
  field :route_short_name, type: String
  field :route_long_name, type: String
  field :route_desc, type: String
  field :route_type, type: String
  field :route_url, type: String
  field :route_color, type: String
  field :route_text_color, type: String

  index({ route_id: 1 })

  has_many :trips
end
