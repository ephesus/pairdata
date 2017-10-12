# Pairdata

NOTE: This gem is under development, and currently barely works.
Pairdata is a wrapper for the USPTO's Pair Bulk Data public API https://pairbulkdata.uspto.gov/


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'pairdata'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install pairdata

## Usage

Create a pd object, and go to town
```ruby
client = Pairdata::Client.new()
res = client.pair_sync(applId: '12432343')
puts res.appStatus
puts res.patentTitle
```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/ephesus/pairdata.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
