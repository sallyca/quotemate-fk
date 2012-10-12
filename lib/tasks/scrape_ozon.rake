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
      book =  Nokogiri::HTML(open("http://www.ozon.ru" + row.to_s.strip))

      book.xpath("//td[@class='Description']").each do |book_link|
        puts "+1 book"
        l = lambda {|xpath| book_link.at_xpath(xpath).to_s.strip}
        book_item = Source.new
        book_item.author =  Author.find_or_create_by_name(l.call("p[@class='Author']/text()"))
        book_item.title = l.call("h3/a/text()")
        book_item.genre = l.call("h1[@class='mainText']/text()")
        puts book_item.title
        book_url = l.call("h3/a/@href")
        book_item.import_url = book_url

        book_details = Nokogiri::HTML(open("http://www.ozon.ru" + book_url.to_s.strip))
        puts "#{book_url} opened"
        book_details.xpath("//div[@class='content-block product-block']").each do |book_det|
          puts "entering product block..."
          bl = lambda {|xpath| book_det.at_xpath(xpath).to_s.strip}
          book_item.human_id = ""
          book_item.build_image
          url = bl.call("div/div/div/div/div[@class='img']/img/@src")
          puts "url= #{url}"
          book_item.image.image_url = "http:#{url}"
          book_item.image.save
          puts "image_url = #{book_item.image.image_url}"
        end

        book_item.save unless Source.find_by_title(book_item.title)
        books << book_item
        sleep 5
      end
    end
  end

  desc "Get more details for books urls"
  task :ozondetails => :environment do
  end

end