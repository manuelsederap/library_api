defmodule LibraryApiWeb.ErrorView do
  use LibraryApiWeb, :view
  
  def template_not_found(template, _assigns) do
    %{errors: %{detail: Phoenix.Controller.status_message_from_template(template)}}
  end

  def render("error.json", %{message: message}) do
    %{
      message: message
    }
  end

  def render("error.json", %{error: error}) do
    %{
      errors: error
    }
  end
end
