juvet
=====

## DESCRIPTION

A factory and storage mechanism to store your bot information, backed by Redis.

A word about the future
-----------------------

The initial intent of this gem is to just store information about the bots you are running. This will in the near future be able to start, stop, and pause bots by turning on/off their senses. In addition by integrating message queuing (right now just by using Redis) will be able to send messages to/from the bots within the factory. This will allow things such as adding health checks, broadcasting messages to all bots, etc.

## USAGE

* Creating a bot

```
Juvet::Bot.create bot_id, bot_attributes
```

* Destroying a bot

```
Juvet::Bot.destroy bot_id
```
