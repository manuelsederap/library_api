defmodule LibraryApi.Factory do
  @moduledoc false
  use ExMachina.Ecto, repo: LibraryApi.Repo
  alias LibraryApiWeb.Schemas.{
    Person
  }

  def person_factory do
    %Person{}
  end
end