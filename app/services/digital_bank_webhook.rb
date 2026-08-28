class DigitalBankWebhook
    require 'net/http'

    def self.send(payment_transaction)
        puts "Starting sending to client..."

        uri = URI.parse(
            ENV.fetch("DIGITAL_BANK_WEBHOOK_URL")
        )

        http = Net::HTTP.new(uri.host, uri.port)

        request = Net::HTTP::Post.new(uri.request_uri)

        request["Content-Type"] = "application/json"

        request.body = {
            reference: payment_transaction.reference,
            status: payment_transaction.status,
            amount: payment_transaction.amount,
            currency: payment_transaction.currency,
            payment_method: {
                code: payment_transaction.payment_method.code,
                name: payment_transaction.payment_method.name
            }
        }.to_json

        response = http.request(request)

        puts "Webhook response: #{response.code}\n\n"

        response
    end
end