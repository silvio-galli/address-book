require_relative '../models/address_book'

RSpec.describe AddressBook do

	describe "attributes" do
		it "should respond to entries" do
			book = AddressBook.new
			expect(book).to respond_to(:entries)
		end

		it "should initialize entries as an array" do
			book = AddressBook.new
			expect(book.entries).to be_a(Array)
		end

		it "should initialize entries as empty" do
			book = AddressBook.new
			expect(book.entries.size).to eq(0)
		end
	end

	describe "#add_entry" do
		it "should add only one entry to the address book" do
			book = AddressBook.new
			book.add_entry('Ada Lovelace', '333-2525250', 'ada@lovelace.com')

			expect(book.entries.size).to eq(1)
		end

		it "should add the correct informations to entries" do
			book = AddressBook.new
			book.add_entry('Ada Lovelace', '333-2525250', 'ada@lovelace.com')
			new_entry = book.entries[0]

			expect(new_entry.name).to eq("Ada Lovelace")
			expect(new_entry.phone_number).to eq("333-2525250")
			expect(new_entry.email).to eq("ada@lovelace.com")
		end
	end

end
