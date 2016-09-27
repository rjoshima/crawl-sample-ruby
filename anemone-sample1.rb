require 'anemone'

Anemone.crawl("http://news.yahoo.co.jp/", :depth_limit => 0) do |anemone|
  anemone.on.every_page do |page|
    page.doc.xpath(
    "//*[@id=¥"editorsPick¥"]/div/ul[1]/li/div/p/a").each do |title|
    )

    puts title.text
    end
  end
end
