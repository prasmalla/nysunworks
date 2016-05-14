class Demographic < ActiveRecord::Base
  belongs_to :school

  def self.import(file="demographic.xls")
    spreadsheet = Roo::Excel.new(file)
    headers = spreadsheet.row(1)
    header = []
    headers.each do |column|
      header << column.gsub(/( )/, '_').gsub(/#_/, '').downcase!
    end
    Demographic.destroy_all

    (2..spreadsheet.last_row).each do |i|
      row = Hash[[header, spreadsheet.row(i)].transpose]
      demographic = Demographic.new
      demographic.attributes = row.to_hash.slice(*Demographic.attribute_names)
      demographic.school = School.find_by(ats_system_code: row["dbn"])
      demographic.save!
    end
  end
end
