defmodule LibraryApiWeb.PersonView do
  use LibraryApiWeb, :view

  def render("result.json", %{result: result}) do
    result
  end
end