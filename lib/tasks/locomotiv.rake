namespace :locomotiv do

  desc 'Parse MNR GTFS Data'
  task :parse_gtfs => :environment do
    parsers = %w(route_parser trip_parser stop_parser stop_time_parser)
    parsers.each do |parser_name|
      parser = "Locomotiv::#{parser_name.classify}".constantize
      puts Benchmark.measure { parser.new.parse! }
    end
  end
end