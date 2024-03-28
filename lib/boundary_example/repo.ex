defmodule BoundaryExample.Repo do
  use Ecto.Repo,
    otp_app: :boundary_example,
    adapter: Ecto.Adapters.Postgres
end
