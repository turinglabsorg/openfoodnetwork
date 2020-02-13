module OrdersHelper
  def order_paid_via(order)
    # `sort_by` avoids additional database queries when payments are loaded
    # already. There is usually only one payment and this shouldn't cause
    # any overhead compared to `order(:updated_at)`.
    #
    # Using `last` without sort is not deterministic.
    order.payments.sort_by(&:updated_at).last.andand.payment_method
  end
end
