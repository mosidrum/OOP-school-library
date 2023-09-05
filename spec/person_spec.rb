require_relative 'nameable'
require_relative 'capitalize_decorator'
require_relative 'trimmer_decorator'

Rspec.describe Person do
  let(:person) { Person.new(22, 'John Doe', parent_permission: true) }

  describe '#initialize' do
    it 'creates person with the given age, name, parent persmission' do
      expect(person.age).to eql(22)
      expect(person.name).to eql('John Doe')
      expect(person.parent_permission).to eql(true)
      expect(person.rentals).to be_an(Array)
      expect(person.rentals).to be_empty
    end

    it 'generate a random id for each person created' do
      expect(person.id).to be_a(Integer)
    end
  end

  describe '#correct_name' do
    it 'returns the correct name' do
      expect(person.correct_name).to eql('John Doe')
    end
  end

  describe '#can_use_service?' do
    context 'When the person is of age:' do
      let(:person) { Person.new(30, 'Isaac', parent_permission: false) }
      it "is allowed to use service if he's 18 or older" do
        expect(person.can_use_service?).to eql(true)
      end
    end

    context 'When the person has parent permission' do
      let(:person) { Person.new(15, 'Jalloh', parent_permission: true) }
      it "is allowed to use service if he's less than 18 and has parent permission" do
        expect(person.can_use_service?).to eql(true)
      end
    end

    context 'when the person is neither of age nor has parent permission' do
      let(:person) { Person.new(15, 'Charlie', parent_permission: false) }
      it 'returns false' do
        expect(person.can_use_service?).to eql(false)
      end
    end
  end

  describe '#add_rental' do
    it 'adds a rental to the person' do
      rental = double('Rental')
      person.add_rental(rental)

      expect(person.rentals).to include(rental)
    end
  end

  describe '#list_rentals' do
    it 'prints rentals for the person' do
      rental = double('Rental', book: double('Book', title: 'Sample Title', author: 'Sample Author'),
                                date: '2023-09-01')
      person.add_rental(rental)

      expected_output = "John Doe's rentals:\nBook: Sample Title by Sample Author on Date: 2023-09-01\n"
      expect { person.list_rentals }.to output(expected_output).to_stdout
    end

    it 'prints a message for no rentals' do
      expected_output = "No rentals for John Doe\n"
      expect { person.list_rentals }.to output(expected_output).to_stdout
    end
  end
end
