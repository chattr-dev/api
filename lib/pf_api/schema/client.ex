defmodule PfApi.Schema.Client do
  use Ecto.Schema
  import Ecto.Changeset
  alias PfApi.Schema.User
  alias PfApi.Schema.UserClient

  @derive {Jason.Encoder, only: [:name]}

  schema "clients" do
    field :name, :string
    many_to_many :users, User, join_through: UserClient

    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end


# {
#   "address": "52 Puppet Ln",
#   "authid": "auth0|621138e1c41ff000728542be",
#   "city": "columbus",
#   "email": "james_h@gmail.com",
#   "state": "OH",
#   "zip": "43215",
#   "clients": [
#       {
#           "name": "fakeClient",
#           "projects": [
#               {
#                   "name": "fakeproject"
#               }
#           ]
#       }
#   ]
# }