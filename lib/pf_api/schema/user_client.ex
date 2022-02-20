defmodule PfApi.Schema.UserClient do
    use Ecto.Schema
    import Ecto.Changeset
    alias PfApi.Schema.User
    alias PfApi.Schema.Client

    schema "users_clients" do
        belongs_to :user, User
        belongs_to :client, Client

        timestamps()
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> Ecto.Changeset.cast(params, [:user_id, :client_id])
        |> Ecto.Changeset.validate_required([:user_id, :client_id])
      end
end