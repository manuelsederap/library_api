defmodule LibraryApiWeb.Contexts.PersonContext do
  @moduledoc false

  import Ecto.{Query}, warn: false
  import Ecto.Changeset

  alias LibraryApi.Repo
  alias LibraryApiWeb.Schemas.Person

  def insert_person_seed(params) do
    params
    |> get_person()
    |> insert_update_person(params)
  end

  def get_person(params) do
    Person |> Repo.get_by(%{id: params.id})
  end

  def insert_update_person(person, params) when is_nil(person) do
    %Person{}
    |> Person.changeset(params)
    |> Repo.insert()
  end

  def insert_update_person(person, params) do
    person
    |> Person.changeset(params)
    |> Repo.update()
  end

  def validate_params(:create_person, params) do
    fields = %{
      first_name: :string,
      middle_name: :string,
      last_name: :string,
      suffix: :string,
      birth_date: :string,
      id_type: :string,
      id_no: :string,
      address: :string,
      contact_no: :string
    }

    {%{}, fields}
    |> cast(params, Map.keys(fields))
    |> is_valid_changeset?()
  end

  def create_person({:error, changeset}), do: {:error, changeset}
  def create_person(params) do
    %Person{}
    |> Person.changeset(params)
    |> Repo.insert()
    |> case do
      {:ok, _person} ->
        %{success: true}
      _ ->
        %{success: false}
    end
  end

  def is_valid_changeset?(changeset), do: {changeset.valid?, changeset}

end

