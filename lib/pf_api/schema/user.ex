defmodule PfApi.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias PfApi.Repo
  alias PfApi.Schema.Client
  alias PfApi.Schema.UserClient

  @derive {Jason.Encoder, only: [:address, :authid, :city, :email, :state, :zip, :clients]}

  schema "users" do
    field :address, :string
    field :authid, :string
    field :city, :string
    field :email, :string
    field :state, :string
    field :zip, :string
    many_to_many :clients, Client, join_through: UserClient

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:address, :city, :state, :zip, :email, :authid])
    |> validate_required([:address, :city, :state, :zip, :email, :authid])
  end

  def get_by_id(id) do
    Repo.get_by(__MODULE__, id: id) |> Repo.preload([:clients])
  end
end
