# PfApi

Docker:

`docker-compose up -d`

To start your Phoenix server:

- Install dependencies with `mix deps.get`
- Run migrations with `mix ecto.migrate`
- Seed database with `mix run priv/repo/seeds.exs`
- Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

## Test

`curl http://localhost:4000/api/v1/healthcheck`
