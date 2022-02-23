defmodule PfApiWeb.UserSocket do
  use Phoenix.Socket

  channel "user:*", PfApiWeb.UserChannel

  @impl true
  def connect(_params, socket, _connect_info) do
    IO.inspect(socket, label: "connected:")
    {:ok, socket}
  end

  @impl true
  def id(_socket), do: nil
end
