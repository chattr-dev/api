defmodule PfApi.Repo.Migrations.ProjectClient do
  use Ecto.Migration

  def change do
    alter table(:projects) do
      add :client_id, references(:clients)
    end
  end
end
