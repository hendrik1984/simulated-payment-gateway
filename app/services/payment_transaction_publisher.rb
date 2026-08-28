class PaymentTransactionPublisher
    QUEUE_NAME = "payment_transactions.process"

    def self.publish(payment_transaction)
        channel = RabbitmqClient.channel

        queue = channel.queue(
            QUEUE_NAME,
            durable: true
        )

        queue.publish(
            {
                payment_transaction_id: payment_transaction.id
            }.to_json,
            persistent: true,
            content_type: "application/json"
        )
    end
end