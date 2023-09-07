class FileWriter
  def write_book_to_file(book)
    File.open("books.json", "a") do |file|
      data = { "S/NO" => book.index, "Title" => book.title, "Author" => book.author }
      write_data_to_file("books.json", data)
    end
  end

  def write_person_to_file(person)
    File.open("people.json", "a") do |file|
      data = {
        "Id" => person.id,
        "Name" => person.name,
        "Age" => person.age,
        "Class" => person.class.to_s
      }
      write_data_to_file('people.json', data)
    end
  end

  def write_rental_to_file(rental)
    File.open("rental.json", "a") do |file|
      data = { "Person" => rental.person.name, "Book" => rental.book.title, "Author" => rental.book.author, "Date" => rental.date }
      write_data_to_file('rental.json', data)
    end
  end

  private

  def write_data_to_file(filename, data)
    File.open(filename, "a") do |file|
      file.puts(data.to_json)
    end
  end
end