defmodule LibraryApiWeb.Schemas.Book do
  @moduledoc false

  use LibraryApiWeb.Schema

  schema "books" do
    field :name, :string
    field :author, :string
    field :isbn, :string
    field :serial_no, :string
    field :category, :string
    field :date_created, :string

    timestamps()
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :name,
      :author,
      :isbn,
      :serial_no,
      :category,
      :date_created
    ])
  end
end