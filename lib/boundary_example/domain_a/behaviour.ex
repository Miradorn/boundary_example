defmodule BoundaryExample.DomainA.Behaviour do
  @callback echo(String.t()) :: String.t()
end
