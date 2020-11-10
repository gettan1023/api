require 'csv'

namespace :migration_tool do
	desc "実行処理の説明"
	task :universities => :environment do
    CSV.read("./lib/tasks/universities.csv").each_with_index do |row, ri|
      p ri
      name = row[0]
      p row
      # あるか探す
      university = University.find_by(name: name)
			# なかったら作る
			University.create(name: name) if university.nil?
		end
		
		CSV.read("./lib/tasks/university_colors.csv").each_with_index do |row, ri|
      p ri
      color, name = row[0], row[1]
      p row
      # あるか探す
			university = University.find_by(name: name)
			p university
			# color追加
			university.update_attribute(:color, color) unless university.nil?
		end
	end
end
