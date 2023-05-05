defmodule PlanningWebpage.PagesTest do
  use PlanningWebpage.DataCase

  alias PlanningWebpage.Pages

  describe "meetings" do
    alias PlanningWebpage.Pages.Meeting

    import PlanningWebpage.PagesFixtures

    @invalid_attrs %{date: nil, project: nil, title: nil}

    test "list_meetings/0 returns all meetings" do
      meeting = meeting_fixture()
      assert Pages.list_meetings() == [meeting]
    end

    test "get_meeting!/1 returns the meeting with given id" do
      meeting = meeting_fixture()
      assert Pages.get_meeting!(meeting.id) == meeting
    end

    test "create_meeting/1 with valid data creates a meeting" do
      valid_attrs = %{date: ~D[2023-05-03], project: "some project", title: "some title"}

      assert {:ok, %Meeting{} = meeting} = Pages.create_meeting(valid_attrs)
      assert meeting.date == ~D[2023-05-03]
      assert meeting.project == "some project"
      assert meeting.title == "some title"
    end

    test "create_meeting/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Pages.create_meeting(@invalid_attrs)
    end

    test "update_meeting/2 with valid data updates the meeting" do
      meeting = meeting_fixture()
      update_attrs = %{date: ~D[2023-05-04], project: "some updated project", title: "some updated title"}

      assert {:ok, %Meeting{} = meeting} = Pages.update_meeting(meeting, update_attrs)
      assert meeting.date == ~D[2023-05-04]
      assert meeting.project == "some updated project"
      assert meeting.title == "some updated title"
    end

    test "update_meeting/2 with invalid data returns error changeset" do
      meeting = meeting_fixture()
      assert {:error, %Ecto.Changeset{}} = Pages.update_meeting(meeting, @invalid_attrs)
      assert meeting == Pages.get_meeting!(meeting.id)
    end

    test "delete_meeting/1 deletes the meeting" do
      meeting = meeting_fixture()
      assert {:ok, %Meeting{}} = Pages.delete_meeting(meeting)
      assert_raise Ecto.NoResultsError, fn -> Pages.get_meeting!(meeting.id) end
    end

    test "change_meeting/1 returns a meeting changeset" do
      meeting = meeting_fixture()
      assert %Ecto.Changeset{} = Pages.change_meeting(meeting)
    end
  end
end
