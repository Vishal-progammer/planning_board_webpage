defmodule PlanningWebpageWeb.HomeLiveTest do
  use PlanningWebpageWeb.ConnCase

  import Phoenix.LiveViewTest
  import PlanningWebpage.MeetingFixtures

  @create_attrs %{date: "2023-05-03", project: "some project", title: "some title"}
  @update_attrs %{date: "2023-05-04", project: "some updated project", title: "some updated title"}
  @invalid_attrs %{date: nil, project: nil, title: nil}

  defp create_home(_) do
    home = home_fixture()
    %{home: home}
  end

  describe "Index" do
    setup [:create_home]

    test "lists all meetings", %{conn: conn, home: home} do
      {:ok, _index_live, html} = live(conn, ~p"/meetings")

      assert html =~ "Listing Meetings"
      assert html =~ home.project
    end

    test "saves new home", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/meetings")

      assert index_live |> element("a", "New Home") |> render_click() =~
               "New Home"

      assert_patch(index_live, ~p"/meetings/new")

      assert index_live
             |> form("#home-form", home: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#home-form", home: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/meetings")

      html = render(index_live)
      assert html =~ "Home created successfully"
      assert html =~ "some project"
    end

    test "updates home in listing", %{conn: conn, home: home} do
      {:ok, index_live, _html} = live(conn, ~p"/meetings")

      assert index_live |> element("#meetings-#{home.id} a", "Edit") |> render_click() =~
               "Edit Home"

      assert_patch(index_live, ~p"/meetings/#{home}/edit")

      assert index_live
             |> form("#home-form", home: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#home-form", home: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/meetings")

      html = render(index_live)
      assert html =~ "Home updated successfully"
      assert html =~ "some updated project"
    end

    test "deletes home in listing", %{conn: conn, home: home} do
      {:ok, index_live, _html} = live(conn, ~p"/meetings")

      assert index_live |> element("#meetings-#{home.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#meetings-#{home.id}")
    end
  end

  describe "Show" do
    setup [:create_home]

    test "displays home", %{conn: conn, home: home} do
      {:ok, _show_live, html} = live(conn, ~p"/meetings/#{home}")

      assert html =~ "Show Home"
      assert html =~ home.project
    end

    test "updates home within modal", %{conn: conn, home: home} do
      {:ok, show_live, _html} = live(conn, ~p"/meetings/#{home}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Home"

      assert_patch(show_live, ~p"/meetings/#{home}/show/edit")

      assert show_live
             |> form("#home-form", home: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#home-form", home: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/meetings/#{home}")

      html = render(show_live)
      assert html =~ "Home updated successfully"
      assert html =~ "some updated project"
    end
  end
end
