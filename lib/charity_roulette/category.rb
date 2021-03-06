class CharityRoulette::Category
    attr_accessor :name, :url

    @@all_cat = []
    @@all_sub = []
    @@all_char = []

    def self.scrape_categories
        doc = Nokogiri::HTML(open("https://www.charitynavigator.org/index.cfm?bay=content.view&cpid=4529"))
        doc.search(".category.clearfix.list-url-discover div.cat-box").each do |div| 
        category = self.new
        category.name = div.search("h3").text
        category.url = "https://www.charitynavigator.org/#{div.search("a").attr("href").value}"
        category.save
        end
    end

    def save
        @@all_cat << self
    end

    def self.all
        @@all_cat
    end


    def self.scrape_subcategories
        self.all.each do |category| 
            sub_doc = Nokogiri::HTML(open(category.url))
            sub_doc.search("td").search("strong").each do |strong|
                subcategory = self.new
                subcategory.name = strong.search("a").text
                subcategory.url = "https://www.charitynavigator.org/#{strong.search("a").attr("href").text}"
                subcategory.save2
        end
        end
    end

    def save2
        @@all_sub << self
    end

    def self.all2
        @@all_sub
    end


    def self.scrape_charities
        self.all2.each do |subcategory| 
            charity_doc = Nokogiri::HTML(open(subcategory.url))
            charity_doc.search("li.cn-search-hover-color").each do |li|
                charity = self.new
                charity.name = li.search("h3").search("a").text
                charity.save3
        end
        end
    end

    def save3
        @@all_char << self.name
    end

    def self.all3
        @@all_char
    end

end

