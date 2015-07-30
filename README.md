# Evented (WIP)

Publish and Subscribe capabilities for Crystal objects.

## Installation

Add it to `Projectfile`

```crystal
deps do
  github "krisleech/evented"
end
```

## Usage

```crystal
require "evented"

class MyPublisher
  include Evented::Publisher

  def call(input)
    result = do_something(input)
    broadcast(:something_happened, result)
  end
end

class MySubscriber
  include Evented::Subscriber

  def something_happened(result)
    # ...
  end
end

publisher = MyPublisher.new
publisher.subscribe(MySubscriber.new)
publisher.call("hello")
```

## Development

### Specs

```
crystal spec
```

## Contributing

1. Fork it ( https://github.com/krisleech/evented/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- Kris Leech(https://github.com/krisleech) Kris Leech - creator, maintainer
