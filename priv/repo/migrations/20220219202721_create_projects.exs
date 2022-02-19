defmodule PfApi.Repo.Migrations.CreateProjects do
  use Ecto.Migration

  def change do
    create table(:projects) do
      add :type, :string

      timestamps()
    end
  end
end
