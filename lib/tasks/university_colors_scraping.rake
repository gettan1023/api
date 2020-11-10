require 'nokogiri'
require 'open-uri'
require 'csv'

namespace :university_scraping do
	desc "実行処理の説明"
	task :university_colors => :environment do
		url = 'https://ja.wikipedia.org/wiki/%E3%82%B9%E3%82%AF%E3%83%BC%E3%83%AB%E3%82%AB%E3%83%A9%E3%83%BC'
		csv_header = ['university_colors']
	
		CSV.open('lib/tasks/result.csv', 'w') do |csv|
			csv << csv_header
			csv << scrape(url)
		end
  end
  
  desc "実行処理の説明"
	task :universities => :environment do
		url = 'https://ja.wikipedia.org/wiki/%E6%97%A5%E6%9C%AC%E3%81%AE%E5%A4%A7%E5%AD%A6%E4%B8%80%E8%A6%A7'
		csv_header = ['universities']

    doc = setup_doc(url)

    universities = doc.xpath("//*[@class='mw-parser-output']/ul/li/a/@title").each_with_object([]) do |li, universies|
      universies << li.text.strip
    end

		CSV.open('lib/tasks/universities.csv', 'w') do |csv|
      csv << csv_header
      universities.each { |university| csv << [university] }
		end
	end
end

def setup_doc(url)
  charset = 'utf-8'
  html = open(url) { |f| f.read }
  doc = Nokogiri::HTML.parse(html, nil, charset)
#   doc.search('br').each { |n| n.replace(" ") }
  doc
end

def scrape(url)
  doc = setup_doc(url)
  color_codes = doc.xpath("//*[@class='NavContent']/table/tbody/tr").each_with_object([]) do |td, color_codes|
	color_codes << td.css("td").attribute("bgcolor").value
  end
  university_name = doc.xpath("//*[@class='NavContent']/table/tbody/tr").each_with_object([]) do |td, university_name|
	university_name << td.text.strip
  end
  set = []
  color_codes.each_with_index do |code, idx|
	set << [code, university_name[idx]]
  end
  set
end
