# Try::Eager

Try to run proc repeatedly until `options[:until]` returns true. Ruby >= 2.0.0 is required.

## Installation

Add this line to your application's Gemfile:

    gem 'try-eager'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install try-eager

## Usage

```ruby
require 'try/eager'

# wait for mail to receive and raise TimeoutError when Mail not found in 10 seconds
mail = Try.eager until: ->(m) { m.to_addrs.any? {|a| a.include?('sunaot') } do
  Mail.last
end

# wait for mail to receive with max retry 3 times (no timeout)
mail = Try.(3.times, until: ->(m) { m.body.include?('sunaot') }) do
  Mail.last
end

# you may also set timeout sec and interval sec
Try.eager until: ->(args) { false },
          timeout: 2,
	  interval: 0.5 do
  puts :hello
end
```

## Contributing

1. Fork it ( http://github.com/<my-github-username>/try-eager/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
