require 'nokogiri'
require 'open-uri'
require 'csv'

namespace :university_colors_scraping do
	desc "実行処理の説明"
	task :scrape => :environment do
		url = 'https://ja.wikipedia.org/wiki/%E3%82%B9%E3%82%AF%E3%83%BC%E3%83%AB%E3%82%AB%E3%83%A9%E3%83%BC'
		csv_header = ['university_colors']
	
		CSV.open('lib/tasks/result.csv', 'w') do |csv|
			csv << csv_header
			csv << scrape(url)
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
