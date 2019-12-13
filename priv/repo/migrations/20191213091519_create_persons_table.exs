defmodule LibraryApi.Repo.Migrations.CreatePersonsTable do
  use Ecto.Migration
  @moduledoc false
  
  def up do
    create table(:persons, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :first_name, :string
      add :middle_name, :string
      add :last_name, :string
      add :suffix, :string
      add :birth_date, :date
      add :id_type, :string
      add :id_no, :string
      add :address, :string
      add :contact_no, :string

      timestamps()
    end
  end

  def down do
    drop table(:persons)
  end
end
