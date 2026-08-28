class PaymentTransactionWorker

    QUEUE_NAME = "payment_transactions.process"

    def self.start
        channel = RabbitmqClient.channel

        queue = channel.queue(
            QUEUE_NAME,
            durable: true
        )

        puts "Payment transaction worker started..."
        puts "Waiting for messages..."

        queue.subscribe(manual_ack: true, block: true) do |delivery_info, _properties, body|
            process(body)

            channel.ack(delivery_info.delivery_tag)
        rescue StandardError => e
            puts "Error processing message: #{e.message}"

            channel.nack(
                delivery_info.delivery_tag,
                false,
                false
            )
        end
    end

    def self.process(body)
        message = JSON.parse(body)

        payment_transaction_id = message.fetch("payment_transaction_id")

        payment_transaction = PaymentTransaction.find(payment_transaction_id)

        puts "Processing transaction:"
        puts "  ID: #{payment_transaction.id}"
        puts "  Reference: #{payment_transaction.reference}"
        puts "  Delay: #{payment_transaction.processing_delay_seconds} seconds"

        sleep(payment_transaction.processing_delay_seconds)

        result = rand < 0.9 ? "successful" : "failed"

        payment_transaction.update!(
            status: result
        )

        puts "Finished delay for transaction #{payment_transaction.id} result: #{result}\n\n"

        DigitalBankWebhook.send(payment_transaction)
    end
end