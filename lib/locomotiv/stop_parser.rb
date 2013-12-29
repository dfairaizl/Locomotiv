module Locomotiv
  class StopParser
    include Locomotiv::Parser

    collection :stop
    gtfs_file :stops
  end
end