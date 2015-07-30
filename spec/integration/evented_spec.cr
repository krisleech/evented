require "../spec_helper"

class MyPublisher
  include Evented::Publisher

  def call(input)
    broadcast(:it_happened, input)
  end
end

class MySubscriber
  include Evented::Subscriber

  def it_happened(input)
    @received_input = input
  end

  def received_input
    @received_input
  end
end

describe "Publishing and Subscribing to events" do

  it "works" do
    input = "hello"
    publisher = MyPublisher.new
    subscriber = MySubscriber.new
    publisher.subscribe(subscriber)
    publisher.call(input)
    subscriber.received_input.should eq input
  end
end
