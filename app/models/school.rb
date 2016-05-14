class School < ActiveRecord::Base
  has_many :demographics

  def self.import(file="school.xls")
    spreadsheet = Roo::Excel.new(file)
    headers = spreadsheet.row(1)
    header = []
    headers.each do |column|
      header << column.gsub(/( )/, '_').downcase!
    end
    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      school = find_by(ats_system_code: row["ats_system_code"]) || new
      school.attributes = row.to_hash.slice(*School.attribute_names)
      school.save!
    end
  end
end
