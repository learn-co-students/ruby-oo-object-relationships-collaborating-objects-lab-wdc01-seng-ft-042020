class MP3Importer
    attr_accessor :path
    def initialize(file_path)
        @path = file_path

    end

    def files
        dir_files = Dir["#{self.path}/*.mp3"]
        dir_files.map{|str| str.delete_prefix("#{self.path}/")}
    end

    def import
        x = self.files
        x.each {|str| Song.new_by_filename(str)}
    end

end
