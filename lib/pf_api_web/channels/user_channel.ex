defmodule PfApiWeb.UserChannel do
  use PfApiWeb, :channel

  @impl true
  def join("user:" <> user, payload, socket) do
    if authorized?(payload) do
      {:ok, socket}
    else
      {:error, %{reason: "unauthorized"}}
    end
  end

  @impl true
  def handle_in("ping", payload, socket) do
    IO.inspect(label: "Pong")
    {:reply, {:ok, payload}, socket}
  end

  @impl true
  def handle_in("shout", payload, socket) do
    broadcast(socket, "shout", payload)
    {:noreply, socket}
  end

  # Eventually implement some sort of auth0 verification???
  defp authorized?(_payload) do
    true
  end
end
