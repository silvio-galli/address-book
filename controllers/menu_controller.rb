require_relative '../models/address_book'

class MenuController
  attr_accessor :address_book

  def initialize
    @address_book = AddressBook.new
  end

  def main_menu
    puts "Main Menu - #{@address_book.entries.count} entries"
    puts "1 - View all entries"
    puts "2 - Create an entry"
    puts "3 - Search for an entry"
    puts "4 - Import entries from a CSV"
    puts "5 - Exit"
    print "Enter your selection: "

    selection = gets.to_i

    case selection
    when 1
      system "clear"
      view_all_entries
      main_menu
    when 2
      system "clear"
      create_entry
      main_menu
    when 3
      system "clear"
      search_entries
      main_menu
    when 4
      system "clear"
      read_csv
      main_menu
    when 5
      puts "Good-bye!"
      exit(0)

    else
      system "clear"
      puts "You inserted an invalid selection."
      puts "Please, try again."
      main_menu
    end
  end

  def view_all_entries
    @address_book.entries.each do |entry|
      system "clear"
      puts entry.to_s
      entry_submenu(entry)
    end
    system "clear"
    puts "End of entries"
  end

  def create_entry
    system "clear"
    puts "New Address Book Entry"
    print "Name: "
    name = gets.chomp
    print "Phone Number: "
    phone_number = gets.chomp
    print "Email: "
    email = gets.chomp

    @address_book.add_entry(name, phone_number, email)

    system "clear"
    puts "New Entry created!"
  end

  def search_entries
    print "Search by name: "
    name = gets.chomp

    match = @address_book.binary_search(name)
    system "clear"

    if match
      puts match.to_s
      search_submenu(match)
    else
      puts "No match found for #{name}"
    end
  end

  def search_submenu(entry)
    puts "\nd - delete this entry"
    puts "e - edit this entry"
    puts "m - return to main menu"
    selection = gets.chomp

    case selection
    when "d"
      system "clear"
      delete_entry(entry)
      main_menu
    when "e"
      edit_entry(entry)
      system "clear"
      main_menu
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "#{selection} is not a valid input"
      puts entry.to_s
      search_submenu(entry)
    end
  end

  def read_csv
    print "Enter CSV file to import:"
    file_name = gets.chomp

    if file_name.empty?
      system "clear"
      puts "No CSV file read"
      main_menu
    end

    begin
      entry_count = @address_book.import_from_csv(file_name).count
      system "clear"
      puts "#{entry_count} entries added from #{file_name}"
    rescue
      puts "#{file_name} is not a valid CSV file, please enter a valid CSV file."
      read_csv
    end
  end

  def entry_submenu(entry)
    puts "n - next entry"
    puts "d - delete entry"
    puts "e - edit this entry"
    puts "m - return to main menu"

    selection = gets.chomp

    case selection
    when "n"
    when "d"
      delete_entry(entry)
    when "e"
      edit_entry(entry)
      entry_submenu(entry)
    when "m"
      system "clear"
      main_menu
    else
      system "clear"
      puts "Your #{selection} is not a valid one."
      puts "Please, try again"
      entry_submenu(entry)
    end
  end

  def delete_entry(entry)
    system "clear"
    puts "#{entry.name} is going to be deleted"
    puts "Are you sure you want this entry?"
    print "#{entry}"
    puts "\nYES/NO"
    answer = gets.chomp
    if answer == "YES"
      @address_book.entries.delete(entry)
      system "clear"
      puts "Entry has been deleted."
    else
      main_menu
    end
  end

  def edit_entry(entry)
    print "Update '#{entry.name}' to: "
    name = gets.chomp
    print "Update #{entry.phone_number} to: "
    phone_number = gets.chomp
    print "Update #{entry.email} to: "
    email = gets.chomp

    entry.name = name if !name.empty?
    entry.phone_number = phone_number if !phone_number.empty?
    entry.email = email if !email.empty?

    system "clear"
    puts "Updated entry: "
    puts entry
  end

end
