defmodule PfApi.Schema.User do
  use Ecto.Schema
  import Ecto.Changeset
  alias PfApi.Repo

  schema "users" do
    field :address, :string
    field :authid, :string
    field :city, :string
    field :email, :string
    field :state, :string
    field :zip, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:address, :city, :state, :zip, :email, :authid])
    |> validate_required([:address, :city, :state, :zip, :email, :authid])
  end

  def get_by_id(id) do
    Repo.get_by(__MODULE__, authid: id)
  end
end
