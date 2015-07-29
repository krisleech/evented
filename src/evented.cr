require "./evented/*"

module Evented
  module Publisher
    def subscribe(listener)
      listeners << listener
    end

    def broadcast(event_name, *args)
    end

    def listeners
      @listeners ||= []
    end
  end
end
