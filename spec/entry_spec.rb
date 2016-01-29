require_relative '../models/entry'

RSpec.describe Entry do

	describe "attributes" do
		it "should respond to name" do
			entry = Entry.new('Ada Lovelace', '333-2525250', 'ada@lovelace.com')
			expect(entry.name).to eq("Ada Lovelace")
		end

		it "should respond to phone number" do
			entry = Entry.new('Ada Lovelace', '333-2525250', 'ada@lovelace.com')
			expect(entry).to respond_to(:phone_number)
		end

		it "should respond to email" do
			entry = Entry.new('Ada Lovelace', '333-2525250', 'ada@lovelace.com')
			expect(entry).to respond_to(:email)
		end
	end

	describe "#to_s" do
		it "should print an entry as a string" do
			entry = Entry.new('Ada Lovelace',  '333-2525250', 'ada@lovelace.com')
			entry_string = "Name: Ada Lovelace\nPhone Number: 333-2525250\nEmail: ada@lovelace.com"
			expect(entry.to_s).to eq(entry_string)
		end
	end
	
end
