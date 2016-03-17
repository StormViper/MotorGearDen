Rails.configuration.stripe = {
  :publishable_key => "pk_test_FyHE4D5njMda11btlysxPkSq",
  :secret_key      => "sk_test_O5i8QMdrcnWXrFSGL7tKAV7U"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]