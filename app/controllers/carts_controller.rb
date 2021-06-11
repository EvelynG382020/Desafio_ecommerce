class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: [:pay_with_paypal]

  def update
    product = params[:cart][:product_id]
    quantity = params[:cart][:quantity]

    current_order.add_product(product, quantity) #add_product modelo order
    Product.products_with_stock #probando este codigo que proviene de
    #application record clase product instanciada para revisar que arroje
    #solo productos en stock

    redirect_to root_url, notice: "Product added successfuly"
  end

  def show
    @order = current_order
  end
  
  def pay_with_paypal
  
    response = EXPRESS_GATEWAY.setup_purchase(@order.total_in_cents,
      ip: request.remote_ip,
      return_url: process_paypal_payment_cart_url,
      cancel_return_url: root_url,
      allow_guest_checkout: true,
      currency: "USD"
    )
    token = response.token
    Payment.start_payment_process(@order, token)
    redirect_to EXPRESS_GATEWAY.redirect_url_for(token)
  end

  def process_paypal_payment
    @details = EXPRESS_GATEWAY.details_for(params_token)
   
    response = EXPRESS_GATEWAY.purchase(paypal_order_total, express_purchase_options)
    if response.success?
      payment = Payment.find_by(token: response.token)
      payment.finish 
    end
  end

  private
  def set_order #se establecen aquí los parametros que recibirá la order
    @order = Order.find(params[:cart][:order_id])
  end

  def paypal_order_total #el total de paypal arriba en details se define
    @details.params["order_total"].to_d * 100
  end

  def params_token #se define el token para poder utilizar si quiésarmos en otra parte del código
    params[:token]
  end

  def express_purchase_options
    {
      ip: request.remote_ip,
      token: params_token,
      payer_id: @details.payer_id,
      currency: "USD"
    }
  end
end

