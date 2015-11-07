class PaypalExpressController < ApplicationController
  before_filter :assigns_gateway

  include ActiveMerchant::Billing
  include PaypalExpressHelper

  def checkout
    total_as_cents, setup_purchase_params = get_setup_purchase_params @cart, request
    setup_response = @gateway.setup_purchase(total_as_cents, setup_purchase_params)
    redirect_to @gateway.redirect_url_for(setup_response.token)
  end

  private
    def assigns_gateway
      @gateway ||= PaypalExpressGateway.new(
        :login => PaypalLogin.login,
        :password => PaypalLogin.password,
        :signature => PaypalLogin.signature,
      )
    end
end