defmodule PfApi.Repo.Migrations.UserClient do
  use Ecto.Migration

  def change do
    create table(:users_clients) do
      add :user_id, references(:users)
      add :client_id, references(:clients)

      timestamps()
    end
  end
end
