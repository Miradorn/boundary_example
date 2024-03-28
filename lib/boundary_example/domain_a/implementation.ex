defmodule BoundaryExample.DomainA.Implementation do
  @behaviour BoundaryExample.DomainA.Behaviour

  @impl true
  def echo(str), do: str
end
