defmodule PlanningWebpage.Repo.Migrations.CreateMeetings do
  use Ecto.Migration

  def change do
    create table(:meetings) do
      add :title, :string
      add :project, :string
      add :date, :date

      timestamps()
    end
  end
end
