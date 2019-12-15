defmodule LibraryApiWeb.Router do
  use LibraryApiWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", LibraryApiWeb do
    pipe_through :api
    
    scope "/library" do
      ## Person
      post "/create_person", PersonController, :create_person
      post "/get_person", PersonController, :get_person
      post "/delete_person", PersonController, :delete_person
      post "/update_person", PersonController, :update_person
      post "/get_persons", PersonController, :get_persons
    end
  end
end
