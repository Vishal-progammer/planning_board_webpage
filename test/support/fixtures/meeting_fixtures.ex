defmodule PlanningWebpage.MeetingFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `PlanningWebpage.Meeting` context.
  """

  @doc """
  Generate a home.
  """
  def home_fixture(attrs \\ %{}) do
    {:ok, home} =
      attrs
      |> Enum.into(%{
        date: ~D[2023-05-03],
        project: "some project",
        title: "some title"
      })
      |> PlanningWebpage.Meeting.create_home()

    home
  end
end
