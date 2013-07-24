# Wheniwork

[![Build Status](https://magnum.travis-ci.com/forward-labs/wheniwork.png?token=Z6AN21geTPF4HNYHvKwp&branch=master)](https://magnum.travis-ci.com/forward-labs/wheniwork)

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
      c.cache_store   = Rails.cache
      c.cache_enabled = true
    end

If you set cache_enabled to false, nothing will be cached:

    WhenIWork.configure do |c|
      c.cache_enabled = false
    end

## TODO

- Add missing endpoints - we currently only handle a few endpoints, would be
great to be able to cover the entire API;
- Error handling - there isn't error handling at the moment - something to
consider when issues occur;
- Test caching logic.

## Contributing

1. [Fork the repository.][fork]
2. [Create a topic branch.][branch]
3. Add specs for your unimplemented feature or bug fix.
4. Run `bundle exec rake`. If your specs pass, return to step 3.
5. Implement your feature or bug fix.
6. Run `bundle exec rake`. If your specs fail, return to step 5.
7. Add documentation for your feature or bug fix.
8. Add, commit, and push your changes.
9. [Submit a pull request.][pr]

## Copyright
Copyright (c) 2013 Forward Labs. See [LICENSE][] for details.

[license]: https://github.com/forward-labs/wheniwork/blob/master/LICENSE.txt
[fork]: http://help.github.com/fork-a-repo/
[branch]: http://learn.github.com/p/branching.html
[pr]: http://help.github.com/send-pull-requests/
[wheniwork]: http://dev.wheniwork.com/
