defmodule LibraryApiWeb.Router do
  use LibraryApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LibraryApiWeb do
    pipe_through :api
    
    scope "/library" do
      post "/create_person", PersonController, :create_person
    end
  end
end
