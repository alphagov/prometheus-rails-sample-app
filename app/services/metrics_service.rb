class MetricsService
  class << self
    TYPES = {
      counter: Prometheus::Client::Counter,
      gauge: Prometheus::Client::Gauge,
    }

    def register(name, type, description)
      @metrics ||= {}

      klass = TYPES.fetch(type)
      metric = klass.new(name, description)
      client.register(metric)

      @metrics[name] = metric
    end

    def increment(name)
      metric(name).increment
    end

    def set(name, value, params = {})
      metric(name).set(params, value)
    end

    private

    def metric(name)
      @metrics.fetch(name)
    end

    def client
      @client ||= Prometheus::Client.registry
    end
  end
end
