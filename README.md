# Dragonfly Chrome Headless

Use headless Chrome to generate PDFs out of HTML.

## Prerequisites

* nodejs
* headless chrome running on a port (by default 9222)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dragonfly_chrome_headless'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dragonfly_chrome_headless

## Usage

Add the plugin to Dragonfly:

```ruby
Dragonfly.app.configure do
  plugin :chrome_headless
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tomasc/dragonfly_chrome_headless.
