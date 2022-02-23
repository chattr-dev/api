defmodule PfApiWeb.UserChannel do
  use PfApiWeb, :channel
  alias PfApiWeb.UserPresence

  @impl true
  def join("user:" <> user, payload, socket) do
    if authorized?(payload) do
      case UserPresence.get_by_key("user:" <> user, payload["id"]) do
        [] -> 
          send(self(), :after_join)
          {:ok, socket |> assign(:user, %{user: payload})}
        res -> 
          {:ok, res, socket}
      end
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  @impl true
  def handle_info(:after_join, %{assigns: %{user: %{user: user}}} = socket) do
    {:ok, _} = UserPresence.track(socket, user["id"], %{
      projects: user["projects"]
    })
    {:noreply, socket}
  end

  @impl true
  def handle_in("timer_start", %{"projectId" => _projectId, "userId" => userId}, socket) do
    UserPresence.get_by_key("user:" <> "#{userId}", userId) |> IO.inspect(label: "user:")
    {:reply, :ok, socket}
  end

  @impl true
  def handle_in("timer_pause", _args, socket) do
    {:reply, :ok, socket}
  end

  @impl true
  def handle_in("timer_resume", _args, socket) do
    {:reply, :ok, socket}
  end

  @impl true
  def handle_in("timer_reset", _args, socket) do
    {:reply, :ok, socket}
  end

  # Eventually implement some sort of auth0 verification
  defp authorized?(_payload) do
    true
  end
end
