class CharityRoulette::Subcategory
    attr_accessor :name, :url

    @@all2 = []
    binding.pry
    
    def self.scrape_subcategories
        self.all2.each do |category| 
            sub_doc = Nokogiri::HTML(open(category.url))
            sub_doc.search("td").search("strong").each do |strong|
                subcategory = self.new
                subcategory.name = strong.search("a").text
                subcategory.url = "https://www.charitynavigator.org/#{strong.search("a").attr("href")}"
                subcategory.save2
        end
    end
    end

    def save2
        @@all2 << self
    end

    def self.all2
        @@all2
    end

end