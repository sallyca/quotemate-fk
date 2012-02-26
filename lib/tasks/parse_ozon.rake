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
          book_item = Book.new
          book_item.author =  Author.find_or_create_by_name(l.call("p[@class='Author']/text()"))
          book_item.title = l.call("h3/a/text()")
          puts book_item.title
          book_item.save unless Book.find_by_title(book_item.title)
          books << book_item
        end
      end
  end
end
