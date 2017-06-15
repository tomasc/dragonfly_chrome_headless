# Dragonfly Chrome Headless

[![Build Status](https://travis-ci.org/tomasc/dragonfly_chrome_headless.svg)](https://travis-ci.org/tomasc/dragonfly_chrome_headless) [![Gem Version](https://badge.fury.io/rb/dragonfly_chrome_headless.svg)](http://badge.fury.io/rb/dragonfly_chrome_headless) [![Coverage Status](https://img.shields.io/coveralls/tomasc/dragonfly_chrome_headless.svg)](https://coveralls.io/r/tomasc/dragonfly_chrome_headless)

Use headless Chrome to generate PDFs out of HTML.

## Requirements

* nodejs

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

Eventually include host & port, if you are running Chrome in something like a Docker container (recommended, see for example [justinribeiro/chrome-headless](https://hub.docker.com/r/justinribeiro/chrome-headless/)):

```ruby
Dragonfly.app.configure do
  plugin :chrome_headless, host: 'chrome_headless', port: '9222'
end

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake test` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tomasc/dragonfly_chrome_headless.
