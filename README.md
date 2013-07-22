# Wheniwork

This is a thin ruby wrapper around the [WhenIWork's][wheniwork] API.

NOTE: this is a work in progress. Please check the TODO section for details
on what's missing. Contributions are welcome!

## Installation

Add this line to your application's Gemfile:

    gem 'wheniwork'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install wheniwork

## Usage

In order to use it, require the gem:

    require 'wheniwork'

Then, add your credentials to the configuration:

    WhenIWork.configure do |c|
      c.username = '<YOUR USERNAME>'
      c.password = '<YOUR PASSWORD>'
      c.api_key =  '<YOUR API KEY>'
    end

Check the options section to see what configuration options you can use.
Finally, use the client:

    => client = WhenIWork::Client.new
    => client.shifts
    => => {"start"=>"Fri, 19 Jul 2013 16:56:34 +0100",
           "end"=>"Mon, 22 Jul 2013 16:56:34 +0100",
           "shifts"=>
            [{"id"=>10876241,
              "account_id"=>11111,
              "user_id"=>222222,
              "location_id"=>33333,
              "position_id"=>44444,
          ...


## Caching

The gem uses active support caching to cache the requests for 1 minute. This
is configurable through the configuration block:

    WhenIWork.configure do |c|
      c.cache = Rails.cache
    end

If you set cache to nil, nothing will be cached.

## TODO

- Add missing endpoints - we currently only handle a few endpoints, would be
great to be able to cover the entire API;
- Error handling - there isn't error handling at the moment - something to
consider when issues occur;
- Test the endpoints already available.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

[wheniwork]: http://dev.wheniwork.com/
