defmodule LibraryApiWeb.Contexts.UtilityContext do
  @moduledoc false

  def transform_error_message(changeset) do
    errors = Enum.map(changeset.errors, fn({key, {message, _}}) ->
      %{
        key => transform_required(key, message)
      }
    end)

    Enum.reduce(errors, fn(head, tail) ->
      Map.merge(head, tail)
    end)
  end

  defp transform_required(key, "Enter"), do: "Enter #{transform_atom(key)}"
  defp transform_required(_key, message), do: "#{message}"

  defp transform_atom(key) do
    key
    |> atom_to_string()
    |> String.split("_")
    |> Enum.join(" ")
  end

  defp atom_to_string(data) do
    data
    |> Atom.to_string()
  rescue
    _ ->
      data
  end

end