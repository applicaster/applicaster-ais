# Applicaster::Ais

This Gem is Applicaster Authentication API wrapper

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'applicaster-ais', :git => "https://github.com/applicaster/applicaster-ais.git"
```

And then execute:

    $ bundle

## Usage

### Configuring
Configure the host, port and Access-Token (currently access token are only available per session)
```ruby
Applicaster::Ais.configure do |config|
  config.host = https://ais.applicaster.com
  config.port = 443
  config.access_token = ENV["ACCESS_TOKEN"]
end
```

If using `Rails` app this code could be inside initializers.

## API Endpoints
## API Endpoints

* [Backend](#backend)
  * [Bucket](#bucket)
  	* [List](#list)
  	* [Post](#post)
  * [App](#app)
	* [List](#list)
    * [Post](#post)
	* [Get](#get)
	* [Update](#update)

### [Backend](#backend)
#### [Bucket](#bucket)
##### [List](#list)

Endpoint: `/backend/buckets`
Params: `access_token`

List of all the buckets for specific account.
```ruby
res = Applicaster::Ais::Bucket.list(:account_id, access_token: :access_token)
```

Example response

Empty body response with a `200 OK` response code
```javascript
{
	data:[{
    			"id":"547de87bdf74b0cd7300d7fc",
        		"name":"Test1",
         	},
         	{
    			"id":"8990gj7bdf74b0cd7300d7fc",
        		"name":"Test2",
         	},
        ],
    	meta_data:{
   		status: 200
        }
}
```
##### [Post](#post)

Endpoint: `/backend/buckets`
Params: `access_token`, `bucket:` { `name`, `applicaster_app`, `crossmates_reporting_enabled`, `feed_reporting_enabled`,   `zuora_billing_enabled`, `zuora_account_id`,       `zuora_subscription_id`, `zuora_active_users_charge_id`,        `zuora_gigabytes_charge_id` }

Create a new bucket for a specific account.
```ruby
res = Applicaster::Ais::Bucket.post(:account_id, params)
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
#### [App](#app)
##### [List](#list)
Endpoint: `/backend/accounts/:account_id/buckets/:bucket_id/apps.json`
Params: `access_token`

List of all the Apps for specific bucket.
```ruby
res = Applicaster::Ais::Apps.list(:bucket_id, :account_id, access_token: :access_token)
```

Example response

Empty body response with a `200 OK` response code
```javascript
{
	data:[{
    			"id":"547de87bdf74b0cd7300d7fc",
        		"name":"Test",
                "os": "ios",
                "identifier" : "com.test"
         	},
         	{
    			"id":"8990gj7bdf74b0cd7300d7fc",
        		"name":"Test",
                "os": "android",
                "identifier": "com.test"
         	},
        ],
    	meta_data:{
   		status: 200
        }
}
```
##### [Post](#post)

Endpoint: `/backend/accounts/:account_id/buckets/:bucket_id/apps.json`
Params: `access_token`, `app:` { `name`, `os`, `identifier`, `gcm_secret_key`, `apns_sandbox_pem`, `apns_production_pem` }

Create a new App for a specific account bucket.
```ruby
res = Applicaster::Ais::App.post(:bucket_id, :account_id, params)
```

Example response

```javascript
{
	data: {
    		"id":"547de87bdf74b0cd7300d7fc",
        	"name":"Test1",
            "os": "ios",
            "identifier": "com.test"
         },
    	meta_data:{
   	    	status: 200
        }
}
```
##### [Get](#get)

Endpoint: `/backend/accounts/:account_id/buckets/:bucket_id/apps/:app_id.json`
Params: `access_token`

Get App by id.
```ruby
res = Applicaster::Ais::App.get(:app_id, :bucket_id, :account_id, params)
```

Example response

```javascript
{
	data: {
    		"id":"547de87bdf74b0cd7300d7fc",
        	"name":"Test1",
            "os": "ios",
            "identifier": "com.test"
         },
    	meta_data:{
   	    	status: 200
        }
}
```
##### [Update](#update)

Endpoint: `/backend/accounts/:account_id/buckets/:bucket_id/apps/:app_id.json`
Params: `app:` { `name`, `os`, `identifier`, `gcm_secret_key`, `apns_sandbox_pem`, `apns_production_pem` }

Get App by id.
```ruby
res = Applicaster::Ais::App.update(:app_id, :bucket_id, :account_id, params)
```

Example response

```javascript
{
	data: {
    		"id":"547de87bdf74b0cd7300d7fc",
        	"name":"Test1",
            "os": "ios",
            "identifier": "com.test"
         },
    	meta_data:{
   	    	status: 200
        }
}
```


## Contributing

1. Clone it
2. Create your feature branch (`git checkout -b new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin new-feature`)
5. Create new pull request with detailed description of what the change is about

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

