defmodule PfApiWeb.UserController do
    use PfApiWeb, :controller
    alias PfApi.Schema.User

    def show(conn, %{"id" => id}) do
        json(conn, User.get_by_id(id))
    end

end