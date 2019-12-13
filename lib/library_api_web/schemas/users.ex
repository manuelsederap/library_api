defmodule LibraryApiWeb.Schemas.Users do
  @moduledoc false

  use LibraryApiWeb.Schema

  schema "users" do
    field :username, :string
    field :password, :string, virtual: true
    field :hashed_password, :string
    field :permissions, :string
    field :role, :string
  end

  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [
      :username,
      :password,
      :permissions,
      :role
    ])
    |> hash_password()
  end

  defp hash_password(%{valid?: false} = changeset), do: changeset
  defp hash_password(%{valid?: true} = changeset) do
    hashedpw = Comeonin.Bcrypt.hashpwsalt(Ecto.Changeset.get_field(changeset, :password))
    Ecto.Changeset.put_change(changeset, :hashed_password, hashedpw)
  end
end