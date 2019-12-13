defmodule LibraryApiWeb.Repo do
  @moduledoc false
  use Ecto.Repo,
    otp_app: :library_api,
    adapter: Ecto.Adapters.Postgres
end
