juvet
=====

## DESCRIPTION

A factory and storage mechanism to store your bot information, backed by Redis.

A word about the future
-----------------------

The initial intent of this gem is to just store information about the bots you are running. This will in the near future be able to start, stop, and pause bots by turning on/off their senses. In addition by integrating message queuing (right now just by using Redis) will be able to send messages to/from the bots within the factory. This will allow things such as adding health checks, broadcasting messages to all bots, etc.

## USAGE

In order to configure Juvet, you will want to specify the repository it will be using. An initializer of some sort would be ideal to place this code in.

```
Juvet.configure do
  adapter :redis, url: ENV["REDIS_URL"]
  mapping do
    collection :bots do
      repository Juvet::BotRepository
      entity Juvet::Bot
    end
  end
end
```

* Creating a bot

```
Juvet::Bot.create! bot_access_token, team_id: "T12345", status: :active
```

* Updating a bot

```
Juvet::Bot.update! bot_access_token, status: :inactive
```

* Destroying a bot

```
Juvet::Bot.destroy! bot_access_token
```

## CONTRIBUTING

1. Clone the repository `git clone https://github.com/tatsuio/juvet`
1. Create a feature branch `git checkout -b my-awesome-feature`
1. Codez!
1. Commit your changes (small commits please)
1. Push your new branch `git push origin my-awesome-feature`
1. Create a pull request `hub pull-request -b tatsuio:master -h tatsuio:my-awesome-feature`

## RELEASING A NEW GEM

1. Bump the VERSION in `lib/juvet/version.rb`
1. run `bundle exec rake build`
1. Commit changes and push to GitHub
1. run `bundle exec rake release`

## LICENSE

Copyright (c) 2016, [Tatsu, LLC](http://tatsu.io).

This project is licensed under the [MIT License](LICENSE.md).
