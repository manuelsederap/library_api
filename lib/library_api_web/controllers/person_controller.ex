defmodule LibraryApiWeb.PersonController do
  use LibraryApiWeb, :controller

  alias LibraryApiWeb.Contexts.{
    PersonContext,
    UtilityContext,
    ValidationContext
    }
  
  alias LibraryApiWeb.{
    ErrorView,
    PersonView
    }

  def create_person(conn, params) do
    :create_person
    |> PersonContext.validate_params(params)
    |> ValidationContext.valid_changeset()
    |> PersonContext.create_person()
    |> return_result("result.json", conn)
  end

  defp return_result({:error, changeset}, _, conn) do
    conn
    |> put_status(200)
    |> put_view(ErrorView)
    |> render("error.json", error: UtilityContext.transform_error_message(changeset))
  end

  defp return_result(result, json_name, conn) do
    conn
    |> put_status(200)
    |> put_view(PersonView)
    |> render(json_name, result: result)
  end
end