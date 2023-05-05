defmodule PlanningWebpage.Pages.Meeting do
  use Ecto.Schema
  import Ecto.Changeset

  schema "meetings" do
    field :date, :date
    field :project, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(meeting, attrs) do
    meeting
    |> cast(attrs, [:title, :project, :date])
    |> validate_required([:title, :project, :date])
  end
end
