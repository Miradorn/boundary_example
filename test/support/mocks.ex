defmodule BoundaryExample.Mocks do
  Mox.defmock(BoundaryExample.DomainA.ImplMock, for: BoundaryExample.DomainA.Behaviour)
end
