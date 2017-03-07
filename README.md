# myfinance-client-ruby

A Ruby client for the [Myfinance](http://www.myfinance.com.br) REST API

[![Gem version](https://badge.fury.io/rb/myfinance.png)](https://rubygems.org/gems/myfinance)
[![Build status](https://travis-ci.org/myfreecomm/myfinance-client-ruby.png?branch=master)](https://travis-ci.org/myfreecomm/myfinance-client-ruby)
[![Test coverage](https://codeclimate.com/github/myfreecomm/myfinance-client-ruby/badges/coverage.svg)](https://codeclimate.com/github/myfreecomm/myfinance-client-ruby)
[![Code Climate grade](https://codeclimate.com/github/myfreecomm/myfinance-client-ruby.png)](https://codeclimate.com/github/myfreecomm/myfinance-client-ruby)

Myfinance API docs: https://app.myfinance.com.br/docs/api

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'myfinance'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install myfinance

## Usage

##### Given your token, create an instance of Myfinance::Client, as below:

```ruby
client = Myfinance.client("YOUR_TOKEN_HERE")
```

##### Now you have access to every API endpoint:

* [Entities API](https://app.myfinance.com.br/docs/api/entities) as `client.entities`
* [PayableAccounts API](https://app.myfinance.com.br/docs/api/payable_accounts) as `client.payable_accounts`
* [ReceivableAccounts API](https://app.myfinance.com.br/docs/api/receivable_accounts) as `client.receivable_accounts`
* [Attachments API](https://app.myfinance.com.br/docs/api/attachments) as `client.attachments`
* [Webhooks API](https://app.myfinance.com.br/docs/api/webhooks) as `client.webhooks`

### Endpoints

#### [Entities](https://app.myfinance.com.br/docs/api/entities)

<table>
  <tr>
    <th>HTTP method</th>
    <th>Endpoint</th>
    <th>Client method</th>
  </tr>
  <tr>
    <td><code>GET</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/entities#get_index" target="_blank">
        /entities
      </a>
    </td>
    <td>
      <code>client.entities.find_all</code>
    </td>
  </tr>
  <tr>
    <td><code>GET</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/entities#get_show" target="_blank">
        /entities/:id
      </a>
    </td>
    <td>
      <code>client.entities.find</code>
    </td>
  </tr>
</table>

#### [PayableAccounts](https://app.myfinance.com.br/docs/api/payable_accounts)

<table>
  <tr>
    <th>HTTP method</th>
    <th>Endpoint</th>
    <th>Client method</th>
  </tr>
  <tr>
    <td><code>POST</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/payable_accounts#post_create" target="_blank">
        /entities/:entity_id/payable_accounts
      </a>
    </td>
    <td>
      <code>client.payable_accounts.create</code>
    </td>
  </tr>
  <tr>
    <td><code>PUT</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/payable_accounts#put_update" target="_blank">
        /entities/:entity_id/payable_accounts/:id
      </a>
    </td>
    <td>
      <code>client.payable_accounts.update</code>
    </td>
  </tr>
  <tr>
    <td><code>PUT</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/payable_accounts#put_pay" target="_blank">
        /entities/:entity_id/payable_accounts/:id/pay
      </a>
    </td>
    <td>
      <code>client.payable_accounts.pay</code>
    </td>
  </tr>
  <tr>
    <td><code>PUT</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/payable_accounts#put_undo_payment" target="_blank">
        /entities/:entity_id/payable_accounts/:id/undo_payment
      </a>
    </td>
    <td>
      <code>client.payable_accounts.undo_payment</code>
    </td>
  </tr>
  <tr>
    <td><code>DELETE</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/payable_accounts#delete_destroy" target="_blank">
        /entities/:entity_id/payable_accounts/:id
      </a>
    </td>
    <td>
      <code>client.payable_accounts.destroy</code>
    </td>
  </tr>
</table>

#### [ReceivableAccounts](https://app.myfinance.com.br/docs/api/receivable_accounts)

<table>
  <tr>
    <th>HTTP method</th>
    <th>Endpoint</th>
    <th>Client method</th>
  </tr>
  <tr>
    <td><code>POST</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/receivable_accounts#post_create" target="_blank">
        /entities/:entity_id/receivable_accounts
      </a>
    </td>
    <td>
      <code>client.receivable_accounts.create</code>
    </td>
  </tr>
  <tr>
    <td><code>PUT</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/receivable_accounts#put_update" target="_blank">
        /entities/:entity_id/receivable_accounts/:id
      </a>
    </td>
    <td>
      <code>client.receivable_accounts.update</code>
    </td>
  </tr>
  <tr>
    <td><code>PUT</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/receivable_accounts#put_receive" target="_blank">
        /entities/:entity_id/receivable_accounts/:id/receive
      </a>
    </td>
    <td>
      <code>client.receivable_accounts.receive</code>
    </td>
  </tr>
  <tr>
    <td><code>PUT</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/receivable_accounts#put_undo_receivement" target="_blank">
        /entities/:entity_id/receivable_accounts/:id/undo_receivement
      </a>
    </td>
    <td>
      <code>client.receivable_accounts.undo_receivement</code>
    </td>
  </tr>
  <tr>
    <td><code>DELETE</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/receivable_accounts#delete_destroy" target="_blank">
        /entities/:entity_id/receivable_accounts/:id
      </a>
    </td>
    <td>
      <code>client.receivable_accounts.destroy</code>
    </td>
  </tr>
</table>

#### [Attachments](https://app.myfinance.com.br/docs/api/attachments)

<table>
  <tr>
    <th>HTTP method</th>
    <th>Endpoint</th>
    <th>Client method</th>
  </tr>
  <tr>
    <td><code>GET</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/attachments#get_index" target="_blank">
        /entities/:entity_id/attachments
      </a>
    </td>
    <td>
      <code>client.attachments.find_all</code>
    </td>
  </tr>
  <tr>
    <td><code>GET</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/attachments#get_show" target="_blank">
        /entities/:entity_id/attachments/:id
      </a>
    </td>
    <td>
      <code>client.attachments.find</code>
    </td>
  </tr>
  <tr>
    <td><code>POST</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/attachments#post_create" target="_blank">
        /entities/:entity_id/attachments
      </a>
    </td>
    <td>
      <code>client.attachments.create</code>
    </td>
  </tr>
  <tr>
    <td><code>DELETE</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/attachments#delete_destroy" target="_blank">
        /entities/:entity_id/attachments/:id
      </a>
    </td>
    <td>
      <code>client.attachments.destroy</code>
    </td>
  </tr>
</table>

#### [Webhooks](https://app.myfinance.com.br/docs/api/webhooks)

<table>
  <tr>
    <th>HTTP method</th>
    <th>Endpoint</th>
    <th>Client method</th>
  </tr>
  <tr>
    <td><code>GET</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/webhooks#get_index" target="_blank">
        /integrations/webhooks
      </a>
    </td>
    <td>
      <code>client.webhooks.find_all</code>
    </td>
  </tr>
  <tr>
    <td><code>GET</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/webhooks#get_show" target="_blank">
        /integrations/webhooks/:id
      </a>
    </td>
    <td>
      <code>client.webhooks.find</code>
    </td>
  </tr>
  <tr>
    <td><code>POST</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/webhooks#post_create" target="_blank">
        /integrations/webhooks
      </a>
    </td>
    <td>
      <code>client.webhooks.create</code>
    </td>
  </tr>
  <tr>
    <td><code>PUT</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/webhooks#put_update" target="_blank">
        /integrations/webhooks/:id
      </a>
    </td>
    <td>
      <code>client.webhooks.update</code>
    </td>
  </tr>
  <tr>
    <td><code>DELETE</code></td>
    <td>
      <a href="https://app.myfinance.com.br/docs/api/webhooks#delete_destroy" target="_blank">
        /integrations/webhooks/:id
      </a>
    </td>
    <td>
      <code>client.webhooks.destroy</code>
    </td>
  </tr>
</table>

### Configuration

```ruby
require 'myfinance'

Myfinance.configure do |m|
  m.url = 'https://sandbox.myfinance.com.br' # defaults to 'https://app.myfinance.com.br' if omitted
  m.user_agent = 'My App v1.0' # optional, but you should pass a custom user-agent identifying your app
end
```

### Multiple accounts

When an account has multiple accounts, an `ACCOUNT_ID` header is required for the requests. To instantiate a new client with an `ACCOUNT_ID` header:

```ruby
client = Myfinance.client("YOUR_TOKEN_HERE", ACCOUNT_ID) # where ACCOUNT_ID is the ID of the account
```

If you instantiate a new client without an `account_id` and the user has more than one account, the lib will raise a [`Myfinance::RequestError`](https://github.com/myfreecomm/myfinance-client-ruby/blob/master/lib/myfinance/response.rb#L33) error. The list of available accounts will be in the body of the object.

```ruby
begin
  client.entities.find_all
rescue Myfinance::RequestError => e
  e.body # { "error" => "O cabeçalho da requisição não possui o atributo ACCOUNT_ID.", "accounts" => [{"account" => { "id" => 3, .. } }, { ... }] }
  e.message # O cabeçalho da requisição não possui o atributo ACCOUNT_ID.
  e.code # 422
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/myfreecomm/myfinance-client-ruby. This project is intended to be a safe and welcoming space for collaboration.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

