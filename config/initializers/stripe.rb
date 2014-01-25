Rails.configuration.stripe = {
  #:publishable_key => ENV[pk_foo]
  #:secret_key => ENV[sk_bar rails s]
  :publishable_key => 'pk_test_7KpNePmvczmbksBYz0NseEuf', # ENV['STRIPE_PUBLISHABLE_KEY'],
  :secret_key      => 'sk_test_gx21CIaCsTdNnQvdAdQDnPk5'  #ENV['STRIPE_SECRET_KEY']
}
Stripe.api_key = Rails.configuration.stripe[:secret_key]