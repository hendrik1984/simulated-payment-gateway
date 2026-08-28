module ApiAuthenticatable
    extend ActiveSupport::Concern

    included do
        before_action :authenticate_api_key
    end

    private
    
    def authenticate_api_key
        provided_api_key = request.headers["X-API-KEY"]
        expected_api_key = ENV.fetch("PAYMENT_GATEWAY_API_KEY")

        return if provided_api_key.present? && ActiveSupport::SecurityUtils.secure_compare(
            provided_api_key,
            expected_api_key
        )

        render json: {
            error: "Unauthorized",
        }, status: :unauthorized
    end
end