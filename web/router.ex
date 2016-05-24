defmodule BlogBackend.Router do
  use BlogBackend.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", BlogBackend do
    pipe_through :api
  end
end
