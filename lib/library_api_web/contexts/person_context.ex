defmodule LibraryApiWeb.Contexts.PersonContext do
  @moduledoc false

  import Ecto.{Query}, warn: false
  import Ecto.Changeset

  alias LibraryApi.Repo
  alias LibraryApiWeb.Schemas.Person

  def insert_person_seed(params) do
    params
    |> get_person(:seed)
    |> insert_update_person(params)
  end

  def get_person(params, :seed) do
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
    |> validate_required([
      :first_name,
      :last_name,
      :birth_date,
      :id_type,
      :id_no,
      :contact_no
      ], message: "Enter")
    |> validate_person()
    |> is_valid_changeset?()
  end

  def validate_params(:get_person, params) do
    fields = %{
      id_no: :string,
      contact_no: :string
    }

    {%{}, fields}
    |> cast(params, Map.keys(fields))
    |> validate_required([:id_no, :contact_no], message: "Enter")
    |> validate_person(:get_person)
    |> is_valid_changeset?()
  end

  defp validate_person(%{valid?: false} = changeset, :get_person), do: changeset
  defp validate_person(%{changes: %{id_no: id_no, contact_no: contact_no}} = changeset, :get_person) do
    id_no
    |> get_person_by_id_no_and_contact_no(contact_no)
    |> validate_person(changeset, :get_person)
  end
  defp validate_person(nil, changeset, :get_person), do: add_error(changeset, :id_no, "Person does not exist.")
  defp validate_person(_, changeset, :get_person), do: changeset
  defp validate_person(%{valid?: false} = changeset), do: changeset
  defp validate_person(%{changes: %{id_no: id_no}} = changeset) do
    id_no
    |> get_person_by_id_no()
    |> validate_person(changeset)
  end
  defp validate_person(nil, changeset), do: changeset
  defp validate_person(_, changeset), do: add_error(changeset, :id_no, "Person already exist.")

  def get_person_by_id_no(id_no) do
    Person
    |> where([p], p.id_no == ^id_no)
    |> select([p], p.id)
    |> Repo.one()
  end

  def get_person_by_id_no_and_contact_no(id_no, contact_no) do
    Person
    |> where([p], p.id_no == ^id_no and p.contact_no == ^contact_no)
    |> select([p], p.id)
    |> Repo.one()
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

  def get_person({:error, changeset}), do: {:error, changeset}
  def get_person(%{id_no: id_no, contact_no: contact_no}) do
    Person
    |> where([p], p.id_no == ^id_no and p.contact_no == ^contact_no)
    |> select([p], %{
      first_name: p.first_name,
      middle_name: p.middle_name,
      last_name: p.last_name,
      suffix: p.suffix,
      birth_date: p.birth_date,
      id_type: p.id_type,
      id_no: p.id_no,
      address: p.address,
      contact_no: p.contact_no
    })
    |> Repo.one()
  end

  def is_valid_changeset?(changeset), do: {changeset.valid?, changeset}
end


