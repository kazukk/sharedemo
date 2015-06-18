Rails.configuration.stripe = {
 # :publishable_key => ENV['STRIPE_PUBLISHABLE_KEY'],
 # :secret_key      => ENV['STRIPE_SECRET_KEY']

 publishable_key => "pk_test_XJ67QZZnnwyCJW2TRVow3UPN"
 secret_key      => "sk_test_mHvznSn71GM6WGi2n65E3Bfa"

}

Stripe.api_key = Rails.configuration.stripe[:secret_key]