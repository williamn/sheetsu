[![Gem Version](https://badge.fury.io/rb/sheetsu.svg)](https://badge.fury.io/rb/sheetsu)
[![Build Status](https://travis-ci.org/williamn/sheetsu.svg?branch=master)](https://travis-ci.org/williamn/sheetsu)
[![Code Climate](https://codeclimate.com/github/williamn/sheetsu/badges/gpa.svg)](https://codeclimate.com/github/williamn/sheetsu)
[![Test Coverage](https://codeclimate.com/github/williamn/sheetsu/badges/coverage.svg)](https://codeclimate.com/github/williamn/sheetsu/coverage)

# Sheetsu

Sheetsu API wrapper

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'sheetsu'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install sheetsu

## Usage

```ruby
require 'bundler/setup'
require 'sheetsu'

client = Sheetsu::Client.new('ebe5b0fa')

response = client.get
# {"status"=>200, "success"=>true, "result"=>[]}

player = { number: '4', name: 'Chris Webber', position: 'Forward' }
response = client.create(player)
# {"status"=>201, "success"=>true, "result"=>"Created."}

response = client.get_column('name')
# {"status"=>200, "success"=>true, "result"=>["Chris Webber"]}
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/williamn/sheetsu. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
