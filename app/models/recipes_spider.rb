class RecipesSpider < Kimurai::Base
  @name = 'recipes_spider'
  @engine = :mechanize

  def self.process(url)
    @start_urls = [url]
    self.crawl!
  end

  def parse(response, data)
    response.xpath("//div[@class='fit-post']").each do |vehicle|
      item = {}

      item[:title]      = vehicle.css('h3.fit-post-title')&.text&.squish
      item[:description]      = vehicle.css('div.fit-post-excerpt')&.text&.squish

      Recipe.where(item).first_or_create
    end
  end
end
