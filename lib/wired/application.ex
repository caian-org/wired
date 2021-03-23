defmodule Wired.Application do
  @moduledoc "OTP Application specification for Wired"

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      Plug.Cowboy.child_spec(
        scheme: :http,
        plug: Wired.Endpoint,
        options: [port: Application.get_env(:wired, :port)]
      )
    ]

    opts = [strategy: :one_for_one, name: Wired.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
