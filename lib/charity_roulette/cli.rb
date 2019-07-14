class CharityRoulette::CLI

    def call
        CharityRoulette::Category.scrape_categories
        CharityRoulette::Category.scrape_subcategories
        CharityRoulette::Category.scrape_charities
        list_categories
        menu
        list_subcategories
        menu_2
        charity_assigner
        minimum_value
        maximum_value
        range
        goodbye
    end

    def list_categories
        puts "Welcome to Charity Roulette! Here are some categories of charities to choose from:"
        @charities = CharityRoulette::Category.all
        @charities.each.with_index(1) do |category, i|
            puts "#{i}. #{category.name}"
          end
    end

    def menu
        input = nil
        unless input == "exit"
          puts "Enter the number of the category you would like to explore:"
          input = gets.strip.downcase
    
          if input.to_i > 0
            the_category = @charities[input.to_i - 1]
            puts "#{the_category.name}"
          elsif input == "list"
            list_categories
          else
            puts "Not sure what you want, type list or exit."
          end
        end
      end

      def list_subcategories
        puts "Here are some additional subcategories pertaining to that category:"
        @subcategories = CharityRoulette::Category.all2
        @subcategories.each.with_index(1) do |subcategory, i|
            puts "#{i}. #{subcategory.name}"
          end
      end
 
      def menu_2
        input = nil
        unless input == "exit"
          puts "Enter the number of the subcategory you would like to explore:"
          input = gets.strip.downcase
    
          if input.to_i > 0
            the_subcategory = @subcategories[input.to_i - 1]
            puts "#{the_subcategory.name}"
          elsif input == "list"
            list_subcategories
          else
            puts "Not sure what you want, type list or exit."
          end
        end
      end

      def charity_assigner
        puts "Here is your assigned charity:"
        @charities2 = CharityRoulette::Category.all3
        puts @charities2.sample
      end

      def minimum_value
        puts "Please input a minimum dollar value:"
        input = nil
        unless input == "exit"
        input = gets.strip.downcase
        unless input.is_a?(Integer) or input.to_i >= 0 or input.nil?
            puts "Input should be a number greater than or equal to 0"
        end
        if input.nil?
          @@min = 0
        else
          @@min = input
        end
      end
      end


      def maximum_value
        puts "Please input a maximum dollar value:"
        input = nil
        unless input == "exit"
        input = gets.strip.downcase
        unless input.is_a?(Integer) or input.to_i > 0 or input.nil?
            puts "Input should be a number more than 0"
        end
        if input.nil?
          @@max = 2000
        elsif input.to_i < @@min.to_i
          puts "Maximum value can not be lower than the minimum value!"
        else
          @@max = input
        end
      end
      end

      def range
        puts "$#{rand(@@min.to_i..@@max.to_i)}"
      end

    
    def goodbye
        puts "Thank you for playing, go out and make a difference!"
    end

end