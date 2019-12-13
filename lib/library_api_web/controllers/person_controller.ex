defmodule LibraryApiWeb.PersonController do
  use LibraryApiWeb, :controller

  alias LibraryApiWeb.Contexts.PersonContext, as: PC
  alias LibraryApiWeb.Contexts.ValidationContext, as: VC
  alias LibraryApiWeb.PersonView, as: PV

  def create_person(conn, params) do
    :create_person
    |> PC.validate_params(params)
    |> VC.valid_changeset()
    |> PC.create_person()
    |> return_result("result.json", conn)
  end

  def return_result(result, json_name, conn) do
    conn
    |> put_status(200)
    |> put_view(PV)
    |> render(json_name, result: result)
  end
end