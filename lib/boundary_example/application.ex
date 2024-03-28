defmodule BoundaryExample.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Boundary, top_level?: true, deps: [BoundaryExample, BoundaryExampleWeb]

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      BoundaryExampleWeb.Telemetry,
      BoundaryExample.Repo,
      {DNSCluster, query: Application.get_env(:boundary_example, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: BoundaryExample.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: BoundaryExample.Finch},
      # Start a worker by calling: BoundaryExample.Worker.start_link(arg)
      # {BoundaryExample.Worker, arg},
      # Start to serve requests, typically the last entry
      BoundaryExampleWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: BoundaryExample.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    BoundaryExampleWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
