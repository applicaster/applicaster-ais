# Applicaster::Ais

This Gem is Applicaster Authentication API wrapper

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'applicaster-ais'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install applicaster-ais

## Usage

### Configuring
Configure the host, port and Access-Token (currently access token are only available per session)
```ruby
Applicaster::Ais.configure do |config|
  config.host = Settings.ais.api_url
  config.port = 443
  config.access_token = ENV["ACCESS_TOKEN"]
end
```

If using `Rails` app this code could be inside initializers.

## API Endpoints
## API Endpoints

* [Backend](#backend)
  * [Bucket](#bucket)
  	* [Buckets](#buckets)
  	* [Create](#create)

### [Backend](#backend)
#### [Bucket](#bucket)
##### [Buckets](#buckets)

Endpoint: `/backend/buckets`
Params: `account_id`, `access_token`

List of all the buckets for specific account.
```ruby
res = Applicaster::Ais::Bucket.buckets(:account_id, access_token: :access_token)
```

Example response

Empty body response with a `200 OK` response code
```javascript
{
	data: "[
        {
            "id":"547de87bdf74b0cd7300d7fc",
            "name":"Test1",
        },
        {
            "id":"547de87bds2347300d7fc",
            "name":"Test2",
        }
        ]",
    meta_data:{
        status: 200
    }
}
```
##### [Create](#create)

Endpoint: `/backend/buckets`
Params: `account_id`, `access_token`, `name`, `applicaster_app`, `crossmates_reporting_enabled`, `feed_reporting_enabled`,   `zuora_billing_enabled`, `zuora_account_id`,       `zuora_subscription_id`, `zuora_active_users_charge_id`,        `zuora_gigabytes_charge_id`

Create a new bucket for a specific account.
```ruby
res = Applicaster::Ais::Bucket.create(:account_id, params)
```

Example response

```javascript
{
	data: {
    	"id":"547de87bdf74b0cd7300d7fc",
        "name":"Test1",
         },
    meta_data:{
   	    status: 200
        }
}
```


## Development

After checking out the repo, run `bin/setup` to install dependencies. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/applicaster-ais. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

