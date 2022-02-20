defmodule PfApi.Repo.Migrations.UserProject do
  use Ecto.Migration

  def change do
    create table(:users_projects) do
      add :user_id, references(:users)
      add :project_id, references(:projects)

      timestamps()
    end
  end
end
