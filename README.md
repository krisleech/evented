# Evented

*A micro library providing Crystal objects with Publish-Subscribe capabilities*

[![Build Status](https://travis-ci.org/krisleech/evented.png?branch=master)](https://travis-ci.org/krisleech/evented)

* Decouple core business logic from external concerns in Hexagonal style architectures
* Use as an alternative to callbacks and Observers
* Connect objects based on context without permanence
* React to events synchronously

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  evented:
    github: krisleech/evented
```

## Usage

### Publishing

By including `Evented::Publisher` your objects get `broadcast` and
`subscribe` methods.

`broadcast` can be called from within your object whenever you want to
broadcast a significant event.

```crystal
require "evented"

class MyPublisher
  include Evented::Publisher

  def call(input)
    result = do_something(input)
    broadcast(:something_happened, result)
  end
end
```

### Subscribing

To subscribe an object to receive events include `Evented::Subscriber` and
provide your own `on_event` method which will receive 2 arguments, the
`event_name` and `payload`.

```crystal
require "evented"

class MySubscriber
  include Evented::Subscriber

  def on_event(event_name, payload)
    # ...
  end
end
```

To subscribe the listener to a publisher:

```crystal
publisher = MyPublisher.new
publisher.subscribe(MySubscriber.new)

publisher.call("hello")
```

In the above example the subscriber will have `on_event(:something_happened, "hello")`
called.

## Development

### Specs

```
crystal spec
```

### Automatically run Specs

```
ls ./**/*.cr | entr crystal spec
```

## Contributing

1. Fork it ( https://github.com/krisleech/evented/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [Kris Leech](https://github.com/krisleech) - creator, maintainer
