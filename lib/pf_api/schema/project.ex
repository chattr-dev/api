defmodule PfApi.Schema.Project do
  use Ecto.Schema
  import Ecto.Changeset
  alias PfApi.Schema.UserProject
  alias PfApi.Schema.User

  @derive {Jason.Encoder, only: [:type]}

  schema "projects" do
    field :type, :string
    many_to_many :users, User, join_through: UserProject
    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:type])
    |> validate_required([:type])
  end
end
