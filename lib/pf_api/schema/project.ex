defmodule PfApi.Schema.Project do
  use Ecto.Schema
  import Ecto.Changeset

  schema "projects" do
    field :type, :string

    timestamps()
  end

  @doc false
  def changeset(project, attrs) do
    project
    |> cast(attrs, [:type])
    |> validate_required([:type])
  end
end
