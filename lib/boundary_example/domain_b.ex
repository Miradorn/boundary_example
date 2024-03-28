defmodule BoundaryExample.DomainB do
  use Boundary, exports: [], deps: [], check: [aliases: true]

  def what do
    # BoundaryExample.DomainA.Implementation.echo("what")
    "what"
  end
end
