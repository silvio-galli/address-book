require_relative '../models/address_book'

RSpec.describe AddressBook do

	let(:book) { AddressBook.new }

	def check_entry(entry, expected_name, expected_phone_number, expected_email)
		expect(entry.name).to eq expected_name
		expect(entry.phone_number).to eq expected_phone_number
		expect(entry.email).to eq expected_email
	end

	describe "attributes" do
		it "should respond to entries" do
			expect(book).to respond_to(:entries)
		end

		it "should initialize entries as an array" do
			expect(book.entries).to be_a(Array)
		end

		it "should initialize entries as empty" do
			expect(book.entries.size).to eq(0)
		end
	end

	describe "#add_entry" do
		it "should add only one entry to the address book" do
			book.add_entry('Ada Lovelace', '333-2525250', 'ada@lovelace.com')

			expect(book.entries.size).to eq(1)
		end

		it "should add the correct informations to entries" do
			book.add_entry('Ada Lovelace', '333-2525250', 'ada@lovelace.com')
			new_entry = book.entries[0]

			expect(new_entry.name).to eq("Ada Lovelace")
			expect(new_entry.phone_number).to eq("333-2525250")
			expect(new_entry.email).to eq("ada@lovelace.com")
		end
	end

	describe "#import_from_csv" do
		it "should import the correct number of entries" do
			book.import_from_csv("entries.csv")
			expect(book.entries.size).to eq(5)
		end

		it "should import correctly the 1st entry" do
			book.import_from_csv("entries.csv")
			entry_one = book.entries[0]
			check_entry(entry_one, "Bill", "555-555-4854", "bill@blocmail.com")
		end

		it "should import correctly the 2nd entry" do
			book.import_from_csv("entries.csv")
			entry_two = book.entries[1]
			check_entry(entry_two, "Gina", "555-555-4854", "gina@blocmail.com")
		end

		it "should import correctly the 3rd entry" do
			book.import_from_csv("entries.csv")
			entry_three = book.entries[2]
			check_entry(entry_three, "John", "555-555-4854", "john@blocmail.com")
		end

		it "should import correctly the 4th entry" do
			book.import_from_csv("entries.csv")
			entry_four = book.entries[3]
			check_entry(entry_four, "Laura", "555-555-4854", "laura@blocmail.com")
		end

		it "should import correctly the 5th entry" do
			book.import_from_csv("entries.csv")
			entry_five = book.entries[4]
			check_entry(entry_five, "Phil", "555-555-4854", "phil@blocmail.com")
		end




	end

end
