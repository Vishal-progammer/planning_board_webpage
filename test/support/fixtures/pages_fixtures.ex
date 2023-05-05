defmodule PlanningWebpage.PagesFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PlanningWebpage.Pages` context.
  """

  @doc """
  Generate a meeting.
  """
  def meeting_fixture(attrs \\ %{}) do
    {:ok, meeting} =
      attrs
      |> Enum.into(%{
        date: ~D[2023-05-03],
        project: "some project",
        title: "some title"
      })
      |> PlanningWebpage.Pages.create_meeting()

    meeting
  end
end
