defmodule LibraryApi.Repo.Migrations.CreateBooksTable do
  use Ecto.Migration
  @moduledoc false

  def up do
    create table(:books, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string
      add :author, :string
      add :isbn, :string
      add :serial_no, :string
      add :category, :string
      add :date_created, :string

      timestamps()
    end
  end

  def down do
    drop table(:books)
  end
end
