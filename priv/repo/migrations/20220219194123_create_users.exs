defmodule PfApi.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users) do
      add :address, :string
      add :city, :string
      add :state, :string
      add :zip, :string
      add :email, :string
      add :authid, :string

      timestamps()
    end
  end
end
