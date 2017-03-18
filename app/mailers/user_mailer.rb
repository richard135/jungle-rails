class UserMailer < ApplicationMailer
  default from: "reply@jungle.com"

  def purchase(order)
    @order = order
    mail(to: order.email, subject:  "Order id: #{order.id}")
  end
end
