class Book < ApplicationRecord
    scope :active_books_with_long_name, -> {where(isDeleted: false)}
    def self.import(file)
       spreadsheet = open_spreadsheet(file)
       header = spreadsheet.row(1)
       (2..spreadsheet.last_row).each do |i|
           row = Hash[[header, spreadsheet.row(i)].transpose]
           book_item = find_by_name(row["name"]) || new
           book_item.attributes = row.to_hash
           book_item.save!
        end
    end
    def self.open_spreadsheet(file)
        case File.extname(file.original_filename)
        when ".xls" then Roo::Excel.new(file.path, nil, :ignore)
        when ".xlsx" then Roo::Excelx.new(file.path)
        else raise "Unknown file type: #{file.original_filename}"
        end
    end
end
