require 'anemone'
require 'nokogiri'
require 'kconv'

urls = []
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466298/")
urls.push("http://www.amazon.co.jp/gp/bestsellers/books/466282/")

opts = {
  :depth_limit => 0,
  :delay => 1
}

Anemone.crawl(urls, opts) do |anemone|
  anemone.on_every_page do |page|
    doc = Nokogiri::HTML.parse(page.body.toutf8)

    category = doc.xpath("//*[@id='zg_browseRoot']/ul/li/a").text
    sub_category = doc.xpath("//*[@id=\"zg_listTitle\"]/span").text
    puts category + "/" + sub_category

    items = doc.xpath("//div[@class=\"zg_itemRow\"]/div[1]/div[2]")

    items.each do |item|
      # 順位
      rank = item.xpath("div[1]/span[@class=\"zg_rankNumber\"]").text
      # 書名
      title = item.xpath("div[\"zg_title\"]/a").text.gsub(' ', '')
      # SERIAL
      serial = item.xpath("div[\"zg_title\"]/a").attribute("href").text.match(%r{dp/(.+?)/})[1]

      puts "#{rank} #{title} #{serial}"
    end
  end
end
