module Locomotiv
  class TripParser
    include Locomotiv::Parser

    collection :trip
    gtfs_file :trips
  end
end