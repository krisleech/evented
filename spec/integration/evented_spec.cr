require "../spec_helper"

class MyPublisher
  include Evented::Publisher

  def call(input)
    broadcast(:it_happened, input)
  end
end

class MySubscriber
  include Evented::Subscriber

  def on_event(event_name, payload)
    @event_name = event_name
    @payload    = payload
  end

  def event_name
    @event_name
  end

  def payload
    @payload
  end
end

describe "Publishing and Subscribing to events" do
  it "works" do
    input = "hello"
    publisher = MyPublisher.new
    subscriber = MySubscriber.new
    publisher.subscribe(subscriber)
    publisher.call(input)
    subscriber.event_name.should eq :it_happened
    subscriber.payload.should eq input
  end
end
