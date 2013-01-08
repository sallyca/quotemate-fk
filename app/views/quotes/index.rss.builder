xml.instruct! :xml, :version => "1.0" 
xml.rss :version => "2.0" do
  xml.channel do
    xml.title "Quotemate"
    xml.description "A blog about software and chocolate"
    xml.link quotes_url

    for quote in @quotes
      xml.item do
        xml.title quote.text
        xml.pubDate quote.created_at.to_s(:rfc822)
        xml.link quote_url(quote)
      end
    end
  end
end