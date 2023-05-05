defmodule PlanningWebpage.Repo do
  use Ecto.Repo,
    otp_app: :planning_webpage,
    adapter: Ecto.Adapters.Postgres
end
