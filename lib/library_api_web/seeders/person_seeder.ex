defmodule LibraryApiWeb.Seeders.PersonSeeder do
  @moduledoc false

  alias LibraryApiWeb.Contexts.PersonContext

  def seed(data) do
    Enum.map(data, fn(d) ->
      case PersonContext.insert_person_seed(d) do
        {:ok, val} ->
          val
      end
    end)
  end
end