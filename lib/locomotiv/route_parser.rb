module Locomotiv
  class RouteParser
    include Locomotiv::Parser

    collection :route
    gtfs_file :routes
  end
end

