require "../spec_helper"

class MyPublisher
  include Evented::Publisher

  def call(input)
    broadcast(:it_happened, input)
  end
end

class MySubscriber
  include Evented::Subscriber
  getter :event_name, :payload

  def on_event(@event_name, @payload)
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
