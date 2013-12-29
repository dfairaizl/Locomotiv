module Locomotiv
  module Parser

    def self.included(base)
      base.extend ClassMethods
    end

    module ClassMethods
      def collection(collection_name)
        self.define_singleton_method(:collection_name) { collection_name.to_s.classify.constantize }
      end

      def gtfs_file(gtfs_file)
        self.define_singleton_method :gtfs_file_name do
          gtfs_path = Dir.glob(File.expand_path(File.dirname(__FILE__) + "../../../public/MNR/*.txt"))
          files = gtfs_path.inject({}) do |paths, file|
            file_name = File.basename(file, '.txt')
            paths[file_name.to_sym] = file
            paths
          end
          files[gtfs_file]
        end
      end
    end

    def parse!
      puts "Parsing #{self.class.collection_name}"
      lines = []
      IO.foreach(self.class.gtfs_file_name) do |line|
        lines << line
        if lines.size > 10000
          parse_lines(lines)
          lines = []
        end
      end
      parse_lines(lines) #Store whats left
    end

    def parse_lines(lines)
      data = FastestCSV.parse(lines.join)
      headers = extract_headers(data)

      batch_attrs = data.map { |line| Hash[headers.zip(line)] }

      self.class.collection_name.collection.insert(batch_attrs) #BAM
      puts "Inserted #{self.class.collection_name.count} #{self.class.collection_name.to_s} objects"
    end

    def extract_headers(lines = [])
      @headers ||= lines.shift
    end
  end
end