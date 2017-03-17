class UserMailer < ApplicationMailer
  default from: "reply@jungle.com"

  def purchase(order)
    @order = order
    mail(to: order.email, subject: order.id)
  end
end
