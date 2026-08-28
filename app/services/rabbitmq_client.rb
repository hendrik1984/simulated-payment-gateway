class RabbitmqClient

    def self.connection
        @connection ||= Bunny.new(
            ENV.fetch("RABBITMQ_URL", "amqp://guest:guest@rabbitmq:5672")
        ).tap(&:start)
    end

    def self.channel
        @channel ||= connection.create_channel
    end

end