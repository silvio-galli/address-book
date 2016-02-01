require_relative 'entry'
require 'csv'

class AddressBook
	attr_accessor :entries

	def initialize
		@entries = []
	end

	def add_entry(name, phone_number, email)
		index = 0
		@entries.each do |entry|
			if name < entry.name
				break
			end
			index += 1
		end
		@entries.insert(index, Entry.new(name, phone_number, email))
	end

	def import_from_csv(file_name)
		#csv_text = File.read(file_name)
		#csv = CSV.parse(csv_text, headers: true, skip_blanks: true)
		csv = CSV.read(file_name, headers: true, skip_blanks: true)
		csv.each do |row|
			add_entry(row["name"], row["phone_number"], row["email"])
		end
	end

	def binary_search(name)
		lower = 0
		upper = @entries.size - 1
		while lower <= upper
			mid = (lower + upper) / 2
			mid_name = @entries[mid].name

			if name == mid_name
				return @entries[mid]
			elsif
				name < mid_name
				upper = mid - 1
			elsif
				name > mid_name
				lower = mid + 1
			end
		end
		return nil
	end

	def iterative_search(name)
		@entries.each do |entry|
			if name == entry.name
				return entry
				break
			else
				return nil
			end
		end
	end

end
