require 'json'

class FileLoader
  def self.load_books_from_file
    load_data_from_file("books.json")
  end

  def self.load_people_from_file
    load_data_from_file("people.json")
  end

  def self.load_rentals_from_file
    load_data_from_file("rental.json")
  end

  private

  def self.load_data_from_file(filename)
    loaded_data = []
    if File.exist?(filename)
      File.open(filename, 'r') do |file|
        file.each_line do |line|
          loaded_data << JSON.parse(line)
        end
      end
    end
    loaded_data
  end
end