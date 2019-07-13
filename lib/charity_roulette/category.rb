class CharityRoulette::Category
    attr_accessor :name, :url

    @@all = []

    def self.scrape_categories
        doc = Nokogiri::HTML(open("https://www.charitynavigator.org/index.cfm?bay=content.view&cpid=4529"))
        doc.search(".category.clearfix.list-url-discover div.cat-box").each do |div| 
        category = self.new
        category.name = div.search("h3").text
        category.url = "https://www.charitynavigator.org/#{div.search("a").attr("href").value}"
        category.save
        end
        scrape_subcategories
        scrape_charities
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    def self.scrape_subcategories
        self.all.each do |category| 
            sub_doc = Nokogiri::HTML(open(category.url))
            sub_doc.search("td").search("strong").each do |strong|
                subcategory = self.new
                subcategory.name = strong.search("a").text
                subcategory.url = "https://www.charitynavigator.org/#{strong.search("a").attr("href")}"
                binding.pry
        end
    end
    end

    def self.scrape_charities
        self.all.each do |subcategory| 
            charity_doc = Nokogiri::HTML(open(subcategory.url))
            charity_doc.search("h3.charity-name-mobile").each do |element|
                binding.pry
                charity = self.new
                charity.name = element.search("a").text
        end
    end
    end

end

