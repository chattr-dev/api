defmodule PfApiWeb.HealthCheckController do 
    use PfApiWeb, :controller

    def index(conn, _params) do
        text(conn, "Up")
    end

end