namespace :scrape do

  require 'nokogiri'
  require 'open-uri'

  desc "Parse some books" do
    yaml = YAML.load(File.read("lib/bookmate-dump.yml"))
    doc = Nokogiri::HTML(open(yaml["sally"]))
    books = Array.new

    doc.xpath("//div[@class='book book_inline book_web']").each do |row|
      l = lambda {|xpath| book_link.at_xpath(xpath).to_s.strip}
      book_item = Book.new
      book_url = l.call("div[@class='shadow']/div[@class='cover']/a/@href")
      book_item.import_url = book_url
      book_item.title = l.call("div[@class='meta']/div[@class='title']/a/text()")
      book_item.author =  Author.find_or_create_by_name(l.call("div[@class='meta']/div[@class='authors']/a/text()"))
    end

  end

  desc "Parse some quotes" do
    yaml = YAML.load(File.read("lib/bookmate-dump.yml"))
    doc = Nokogiri::HTML(open(yaml["sally-quotes"]))
  end
end
