defmodule PfApi.Schema.Client do
  use Ecto.Schema
  import Ecto.Changeset
  alias PfApi.Schema.Project

  @derive {Jason.Encoder, only: [:name]}

  schema "clients" do
    field :name, :string
    has_many :projects, Project
    timestamps()
  end

  @doc false
  def changeset(client, attrs) do
    client
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end