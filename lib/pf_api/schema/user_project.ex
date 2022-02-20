defmodule PfApi.Schema.UserProject do
    use Ecto.Schema
    import Ecto.Changeset
    alias PfApi.Schema.User
    alias PfApi.Schema.Project

    schema "users_projects" do
        belongs_to :user, User
        belongs_to :project, Project

        timestamps()
    end

    def changeset(struct, params \\ %{}) do
        struct
        |> Ecto.Changeset.cast(params, [:user_id, :project_id])
        |> Ecto.Changeset.validate_required([:user_id, :project_id])
      end
end