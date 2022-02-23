defmodule PfApi.Schema.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias PfApi.Schema.UserProject
  alias PfApi.Schema.User
  alias PfApi.Schema.Client

  @derive {Jason.Encoder, only: [:type, :client, :id]}

  schema "projects" do
    field :type, :string
    many_to_many :users, User, join_through: UserProject
    belongs_to :client, Client, foreign_key: :client_id, references: :id
    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:type])
    |> validate_required([:type])
  end
end
