class CharityRoulette::Category
    attr_accessor :name, :url

    @@all = []

    def self.scrape_categories
        doc = Nokogiri::HTML(open("https://www.charitynavigator.org/index.cfm?bay=content.view&cpid=4529"))
        doc.search(".category.clearfix.list-url-discover div.cat-box").each do |div| 
        category = self.new
        category.name = div.search("h3").text
        category.url = div.search("h3").search("href")
        category.save
        end
    end

    def save
        @@all << self
    end

    def self.all
        @@all
    end

    
    def self.scrape_charities
        
    end
end

