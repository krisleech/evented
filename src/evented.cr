require "./evented/*"

module Evented
  module Subscriber
  end

  module Publisher
    def subscribe(listener)
      listeners << listener
    end

    def broadcast(event_name, *args)
      listeners.each do |listener|
        if listener.responds_to?(event_name.to_sym)
          listener.send(event_name)
        end
      end
    end

    def listeners
      @listeners ||= [] of Evented::Subscriber
    end
  end
end
