module Locomotiv
  class StopTimeParser
    include Locomotiv::Parser

    collection :stop_time
    gtfs_file :stop_times
  end
end