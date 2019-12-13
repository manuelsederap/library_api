defmodule LibraryApiWeb.Schemas.BorrowedBook do
  @moduledoc false

  use LibraryApiWeb.Schema

  schema "borrowed_books" do
    field :name, :string
    field :author, :string
    field :isbn, :string
    field :category, :string
    field :date_borrowed, :date

    timestamps()

    has_many :books, LibraryApiWeb.Schemas.Book,
      on_delete: :delete_all, foreign_key: :id
    has_many :persons, LibraryApiWeb.Schemas.Person,
      on_delete: :delete_all, foreign_key: :id
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :book_id,
      :student_id,
      :name,
      :author,
      :isbn,
      :category,
      :date_borrowed
    ])
  end
  
end
