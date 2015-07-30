require "./evented/*"

module Evented
  module Subscriber
  end

  module Publisher
    def subscribe(listener)
      listeners << listener
    end

    def broadcast(event_name, *args)
    end

    def listeners
      @listeners ||= [] of Evented::Subscriber
    end
  end
end
