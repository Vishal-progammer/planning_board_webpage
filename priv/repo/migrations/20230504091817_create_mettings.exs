defmodule PlanningWebpage.Repo.Migrations.CreateMettings do
  use Ecto.Migration

  def change do
    create table(:mettings) do
      add :title, :string
      add :project, :string
      add :date, :date

      timestamps()
    end
  end
end
