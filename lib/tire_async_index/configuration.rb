module TireAsyncIndex
  class Configuration
    AVALAIBLE_ENGINE = [:sidekiq, :resque, :none]

    attr_accessor :queue
    attr_accessor :engine
    attr_accessor :sidekiq_retry

    def background_engine type
      if AVALAIBLE_ENGINE.include?(type.to_sym)
        @engine = type.to_sym
      else
        raise EngineNotFound, "Background Engine '#{type}' not found"
      end
    end

    def use_queue name
      @queue = name.to_sym
    end

    def sidekiq_retry_times times
      @sidekiq_retry = times.to_i
    end

    def initialize
      @queue  = :normal
      @engine = :none
      @sidekiq_retry = true
    end

  end
end
