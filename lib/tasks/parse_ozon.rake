class BookItem
  attr_accessor :title, :author, :image_url, :description
end

namespace :parse do

  require 'nokogiri'
  require 'open-uri'

  desc "Parse some books"
  task :ozon => :environment do
      yaml = YAML.load(File.read("lib/ozon-dump.yml"))
      doc = Nokogiri::HTML(open(yaml["fiction"]))
      puts "Fiction opened"
      books = Array.new
      doc.xpath("//div[@class='catBox']/h3/a/@href").each do |row|
        puts "#{row} opened"
        book =  Nokogiri::HTML(open("http://www.ozon.ru"+row.to_s.strip))
        book.xpath("//td[@class='Description']").each do |book_link|
          puts "+1 book"
          l = lambda {|xpath| book_link.at_xpath(xpath).to_s.strip}
          book_item= BookItem.new
          book_item.title =  l.call("p[@class='Author']/text()")
          puts book_item.title
          books << book_item
        end
      end

  end
end
