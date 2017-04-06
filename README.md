# JwtCli

A CLI for generating Json Web Tokens.
Running `jwt_cli` will guide you through a few prompt steps, generate a token and copy it to your clipboard.


**NOTE**: to make copying to clipboard work make sure you have pbcopy (OS X) or xclip (debian/ubuntu) installed on your system.

# TODO

Add support for JWT encryption.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'jwt_cli'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install jwt_cli

## Usage

Run executable `jwt_cli` and follow provided prompts.


## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/jwt_cli.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

