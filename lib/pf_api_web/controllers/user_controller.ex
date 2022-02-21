defmodule PfApiWeb.UserController do
    use PfApiWeb, :controller
    alias PfApi.Schema.User

    def show(conn, %{"id" => id}) do
        case User.get_by_id(id) do
            %User{} = user -> json(conn, user)
            _ -> text(conn, "User not found")
        end
    end

end