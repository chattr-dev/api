defmodule PfApi.Repo do
  use Ecto.Repo,
    otp_app: :pf_api,
    adapter: Ecto.Adapters.Postgres
end
