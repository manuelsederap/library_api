defmodule LibraryApiWeb.Schemas.Persons do
  @moduledoc false

  use LibraryApiWeb.Schema

  schema "persons" do
    field :first_name, :string
    field :middle_name, :string
    field :last_name, :string
    field :suffix, :string
    field :birth_date, :date
    field :id_type, :string
    field :id_no, :string
    field :address, :string
    field :contact_no, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :id,
      :first_name,
      :middle_name,
      :last_name,
      :suffix,
      :birth_date,
      :id_type,
      :id_no,
      :address,
      :contact_no
    ])
  end
end