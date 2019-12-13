use Mix.Config

# In this file, we keep production configuration that
# you'll likely want to automate and keep away from
# your version control system.
#
# You should document the content of this
# file or create a script for recreating it, since it's
# kept out of version control and might be hard to recover
# or recreate for your teammates (or yourself later on).
config :library_api, LibraryApiWeb.Endpoint,
  secret_key_base: "V/NUiT8lDyC4v2K6awmJkHyXM9rlxkxw07kgvte8j6WBUHZLZ4zaooCWDsXf+g7L"

# Configure your database
config :library_api, LibraryApi.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "library_api_prod",
  pool_size: 15
