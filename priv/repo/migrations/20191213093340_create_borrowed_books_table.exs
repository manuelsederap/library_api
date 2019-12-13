defmodule LibraryApi.Repo.Migrations.CreateBorrowedBooksTable do
  @moduledoc false
  use Ecto.Migration

  def up do
    create table(:borrowed_books, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :book_id, references(:books, column: :id, type: :binary_id)
      add :person_id, references(:persons, column: :id, type: :binary_id)
      add :name, :string
      add :author, :string
      add :isbn, :string
      add :category, :string
      add :date_borrowed, :date

      timestamps()
    end
  end

  def down do
    drop table(:borrowed_books)
  end
end
