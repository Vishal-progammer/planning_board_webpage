defmodule PlanningWebpageWeb.Router do
  use PlanningWebpageWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, {PlanningWebpageWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", PlanningWebpageWeb do
    pipe_through :browser

    get "/", PageController, :home
    live "/meetings", MeetingLive.Index, :index
    live "/meetings/new", MeetingLive.Index, :new
    live "/meetings/:id/edit", MeetingLive.Index, :edit

    live "/meetings/:id", MeetingLive.Show, :show
    live "/meetings/:id/show/edit", MeetingLive.Show, :edit

  end

  # Other scopes may use custom stacks.
  # scope "/api", PlanningWebpageWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:planning_webpage, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: PlanningWebpageWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end
end
