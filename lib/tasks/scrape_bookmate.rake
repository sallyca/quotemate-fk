namespace :scrape do

  require 'nokogiri'
  require 'open-uri'

  desc "Parse some books"
  task :bookmate => :environment do
    yaml = YAML.load(File.read("lib/bookmate-dump.yml"))
    doc = Nokogiri::HTML(open(yaml["sally"]))
    books = Array.new

    doc.xpath("//div[@class='book book_inline book_web']").each do |row|
      l = lambda {|xpath| row.at_xpath(xpath).to_s.strip}
      book_item = Book.new
      book_url = l.call("div[@class='shadow']/div[@class='cover']/a/@href")
      puts "book_url=#{book_url}"
      book_item.import_url = book_url
      book_item.title = l.call("div[@class='meta']/div[@class='title']/a/text()")
      puts "book_title=#{book_item.title}"
      book_item.author =  Author.find_or_create_by_name(l.call("div[@class='meta']/div[@class='authors']/a/text()"))
      book_item.human_id = ""
      book_item.genre = ""
      book_item.build_image
      url = l.call("div[@class='shadow']/div[@class='cover']/a/img/@src")
      puts "url= #{url}"
      book_item.image.image_url = ""
      book_item.image.save
      puts "I know this book #{Book.find_by_title(book_item.title)}"
      book_item.save unless Book.find_by_title(book_item.title)
      books << book_item
      sleep 10
    end
    puts "Total books found #{}"

  end

  desc "Parse all quotes"
  task :bookquotes => :environment do
    yaml = YAML.load(File.read("lib/bookmate-dump.yml"))
    doc = Nokogiri::HTML(open(yaml["sally-quotes"]))
    doc.xpath("//section[@class='document']/aside/a/@href").each do |row|
      
      puts "#{row} opened"
      book =  Nokogiri::HTML(open("http://bookmate.com" + row.to_s.strip))
      l = lambda {|xpath| book.at_xpath(xpath).to_s.strip}
      book_item = Book.find_or_create_by_title(l.call("//header[@class='aboutBookHeader']/h1/text()"))
      puts "book #{book_item.title}"
      book_item.save
      book.xpath("//section[@class='documentQuotes']/section/a/text()").each do |quote_link|
        puts "+1 quote"
        lq = lambda {|xpath| quote_link.at_xpath(xpath).to_s.strip}
        quote = Quote.find_or_create_by_text(quote_link)
        quote.user = User.first
        quote.book = book_item
        quote.save
        sleep 5
      end      
    end
  end

  desc "Parse some quotes"
  task :quotessome => :environment do
    yaml = YAML.load(File.read("lib/bookmate-dump.yml"))
    doc = Nokogiri::HTML(open(yaml["sally-quotes"]))
    doc.xpath("//section[@class='document']/aside/a/text()").each do |row|
      
      book_item = Book.find_or_create_by_title(row.to_s.strip)
      puts "book #{book_item.title}"
      book_item.save
      puts 'saved'

      doc.xpath("//section[@class='quote']").each do |quote_link|
        puts "+1 quote"
        lq = lambda {|xpath| quote_link.at_xpath(xpath).to_s.strip}
        quote = Quote.find_or_create_by_text(lq.call("a/text()"))
        quote.user = User.first
        quote.book = book_item
        quote.save
        sleep 5
      end      
    end
  end


end
