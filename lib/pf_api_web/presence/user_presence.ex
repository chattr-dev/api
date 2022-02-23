defmodule PfApiWeb.UserPresence do
    use Phoenix.Presence, otp_app: :pf_api, pubsub_server: PfApi.PubSub
end