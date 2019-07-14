# Charity Roulette

This gem is an interactive program that randomly assigns a charity to the user based on a category of their choice. Once the user has been assigned a charity, they will be shown a random dollar amount from a custom user inputted range to donate. The user is not forced to donate, rather it is just for fun. The choice to donate is up to you!

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'charity_roulette'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install charity_roulette

## Usage

Run ./bin/charity-roulette to execute the gem. From here you will be prompted to type in the number of a category from a provided list. Type in an integer value to move on to the subcategories. From the subcategories, you can choose one that interests you by typing another integer value pertaining to that subcategory. From here you will be randomly assigned a charity to which you can choose to donate. The program will then ask you to input a minimum dollar amount, which can be any integer, and a maximum dollar amount which can be any integer larger than the minimum. A random dollar amount will be assigned to you, which you can then choose to donate to your assigned charity. 

## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/<github username>/charity_roulette.

##Author
Kevin O'Brien

##License
The gem is available as open source under the terms of the MIT License - see the LICENSE.md file for details