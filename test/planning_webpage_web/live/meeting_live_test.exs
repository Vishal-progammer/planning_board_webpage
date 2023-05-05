defmodule PlanningWebpageWeb.MeetingLiveTest do
  use PlanningWebpageWeb.ConnCase

  import Phoenix.LiveViewTest
  import PlanningWebpage.PagesFixtures

  @create_attrs %{date: "2023-05-03", project: "some project", title: "some title"}
  @update_attrs %{date: "2023-05-04", project: "some updated project", title: "some updated title"}
  @invalid_attrs %{date: nil, project: nil, title: nil}

  defp create_meeting(_) do
    meeting = meeting_fixture()
    %{meeting: meeting}
  end

  describe "Index" do
    setup [:create_meeting]

    test "lists all meetings", %{conn: conn, meeting: meeting} do
      {:ok, _index_live, html} = live(conn, ~p"/meetings")

      assert html =~ "Listing Meetings"
      assert html =~ meeting.project
    end

    test "saves new meeting", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/meetings")

      assert index_live |> element("a", "New Meeting") |> render_click() =~
               "New Meeting"

      assert_patch(index_live, ~p"/meetings/new")

      assert index_live
             |> form("#meeting-form", meeting: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#meeting-form", meeting: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/meetings")

      html = render(index_live)
      assert html =~ "Meeting created successfully"
      assert html =~ "some project"
    end

    test "updates meeting in listing", %{conn: conn, meeting: meeting} do
      {:ok, index_live, _html} = live(conn, ~p"/meetings")

      assert index_live |> element("#meetings-#{meeting.id} a", "Edit") |> render_click() =~
               "Edit Meeting"

      assert_patch(index_live, ~p"/meetings/#{meeting}/edit")

      assert index_live
             |> form("#meeting-form", meeting: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#meeting-form", meeting: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/meetings")

      html = render(index_live)
      assert html =~ "Meeting updated successfully"
      assert html =~ "some updated project"
    end

    test "deletes meeting in listing", %{conn: conn, meeting: meeting} do
      {:ok, index_live, _html} = live(conn, ~p"/meetings")

      assert index_live |> element("#meetings-#{meeting.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#meetings-#{meeting.id}")
    end
  end

  describe "Show" do
    setup [:create_meeting]

    test "displays meeting", %{conn: conn, meeting: meeting} do
      {:ok, _show_live, html} = live(conn, ~p"/meetings/#{meeting}")

      assert html =~ "Show Meeting"
      assert html =~ meeting.project
    end

    test "updates meeting within modal", %{conn: conn, meeting: meeting} do
      {:ok, show_live, _html} = live(conn, ~p"/meetings/#{meeting}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Meeting"

      assert_patch(show_live, ~p"/meetings/#{meeting}/show/edit")

      assert show_live
             |> form("#meeting-form", meeting: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#meeting-form", meeting: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/meetings/#{meeting}")

      html = render(show_live)
      assert html =~ "Meeting updated successfully"
      assert html =~ "some updated project"
    end
  end
end
