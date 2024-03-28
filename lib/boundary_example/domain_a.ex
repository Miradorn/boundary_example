defmodule BoundaryExample.DomainA do
  use Boundary, exports: [Behaviour], deps: [], check: [aliases: true]
end
