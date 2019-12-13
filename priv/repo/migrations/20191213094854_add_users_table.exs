defmodule LibraryApi.Repo.Migrations.AddUsersTable do
  @moduledoc false
  use Ecto.Migration

  def up do
    create table(:users, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :username, :string
      add :hashed_password, :string
      add :permissions, :string
      add :role, :string

      timestamps()
    end
  end

  def down do
    drop table(:users)
  end
end
