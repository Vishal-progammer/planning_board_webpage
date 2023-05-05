defmodule PlanningWebpage.Repo.Migrations.CreateHome do
  use Ecto.Migration

  def change do
    create table(:home) do
      add :title, :string
      add :project, :string
      add :date, :date

      timestamps()
    end
  end
end
