# ExcExp

ExcExp is an ambitious attempt at constructing a regular expression DSL. Unfortunately, most regular expressions are write-only. This project aims to fix that.

## Installation

Add this line to your application's Gemfile:

    gem 'exc_ex'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install exc_ex

## Usage

A sample usage would be as follows:

``` RUBY
regex = ExcExp.build do
  any_number { matching 'ExcExp' }
end

"ExcExp".match regex #=> #<MatchData "ExcExp">
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
