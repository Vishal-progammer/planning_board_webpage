defmodule PlanningWebpage.MeetingTest do
  use PlanningWebpage.DataCase

  alias PlanningWebpage.Meeting

  describe "home" do
    alias PlanningWebpage.Meeting.Home

    import PlanningWebpage.MeetingFixtures

    @invalid_attrs %{date: nil, project: nil, title: nil}

    test "list_home/0 returns all home" do
      home = home_fixture()
      assert Meeting.list_home() == [home]
    end

    test "get_home!/1 returns the home with given id" do
      home = home_fixture()
      assert Meeting.get_home!(home.id) == home
    end

    test "create_home/1 with valid data creates a home" do
      valid_attrs = %{date: ~D[2023-05-03], project: "some project", title: "some title"}

      assert {:ok, %Home{} = home} = Meeting.create_home(valid_attrs)
      assert home.date == ~D[2023-05-03]
      assert home.project == "some project"
      assert home.title == "some title"
    end

    test "create_home/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Meeting.create_home(@invalid_attrs)
    end

    test "update_home/2 with valid data updates the home" do
      home = home_fixture()
      update_attrs = %{date: ~D[2023-05-04], project: "some updated project", title: "some updated title"}

      assert {:ok, %Home{} = home} = Meeting.update_home(home, update_attrs)
      assert home.date == ~D[2023-05-04]
      assert home.project == "some updated project"
      assert home.title == "some updated title"
    end

    test "update_home/2 with invalid data returns error changeset" do
      home = home_fixture()
      assert {:error, %Ecto.Changeset{}} = Meeting.update_home(home, @invalid_attrs)
      assert home == Meeting.get_home!(home.id)
    end

    test "delete_home/1 deletes the home" do
      home = home_fixture()
      assert {:ok, %Home{}} = Meeting.delete_home(home)
      assert_raise Ecto.NoResultsError, fn -> Meeting.get_home!(home.id) end
    end

    test "change_home/1 returns a home changeset" do
      home = home_fixture()
      assert %Ecto.Changeset{} = Meeting.change_home(home)
    end
  end

  describe "mettings" do
    alias PlanningWebpage.Meeting.Home

    import PlanningWebpage.MeetingFixtures

    @invalid_attrs %{date: nil, project: nil, title: nil}

    test "list_mettings/0 returns all mettings" do
      home = home_fixture()
      assert Meeting.list_mettings() == [home]
    end

    test "get_home!/1 returns the home with given id" do
      home = home_fixture()
      assert Meeting.get_home!(home.id) == home
    end

    test "create_home/1 with valid data creates a home" do
      valid_attrs = %{date: ~D[2023-05-03], project: "some project", title: "some title"}

      assert {:ok, %Home{} = home} = Meeting.create_home(valid_attrs)
      assert home.date == ~D[2023-05-03]
      assert home.project == "some project"
      assert home.title == "some title"
    end

    test "create_home/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Meeting.create_home(@invalid_attrs)
    end

    test "update_home/2 with valid data updates the home" do
      home = home_fixture()
      update_attrs = %{date: ~D[2023-05-04], project: "some updated project", title: "some updated title"}

      assert {:ok, %Home{} = home} = Meeting.update_home(home, update_attrs)
      assert home.date == ~D[2023-05-04]
      assert home.project == "some updated project"
      assert home.title == "some updated title"
    end

    test "update_home/2 with invalid data returns error changeset" do
      home = home_fixture()
      assert {:error, %Ecto.Changeset{}} = Meeting.update_home(home, @invalid_attrs)
      assert home == Meeting.get_home!(home.id)
    end

    test "delete_home/1 deletes the home" do
      home = home_fixture()
      assert {:ok, %Home{}} = Meeting.delete_home(home)
      assert_raise Ecto.NoResultsError, fn -> Meeting.get_home!(home.id) end
    end

    test "change_home/1 returns a home changeset" do
      home = home_fixture()
      assert %Ecto.Changeset{} = Meeting.change_home(home)
    end
  end

  describe "meetings" do
    alias PlanningWebpage.Meeting.Home

    import PlanningWebpage.MeetingFixtures

    @invalid_attrs %{date: nil, project: nil, title: nil}

    test "list_meetings/0 returns all meetings" do
      home = home_fixture()
      assert Meeting.list_meetings() == [home]
    end

    test "get_home!/1 returns the home with given id" do
      home = home_fixture()
      assert Meeting.get_home!(home.id) == home
    end

    test "create_home/1 with valid data creates a home" do
      valid_attrs = %{date: ~D[2023-05-03], project: "some project", title: "some title"}

      assert {:ok, %Home{} = home} = Meeting.create_home(valid_attrs)
      assert home.date == ~D[2023-05-03]
      assert home.project == "some project"
      assert home.title == "some title"
    end

    test "create_home/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Meeting.create_home(@invalid_attrs)
    end

    test "update_home/2 with valid data updates the home" do
      home = home_fixture()
      update_attrs = %{date: ~D[2023-05-04], project: "some updated project", title: "some updated title"}

      assert {:ok, %Home{} = home} = Meeting.update_home(home, update_attrs)
      assert home.date == ~D[2023-05-04]
      assert home.project == "some updated project"
      assert home.title == "some updated title"
    end

    test "update_home/2 with invalid data returns error changeset" do
      home = home_fixture()
      assert {:error, %Ecto.Changeset{}} = Meeting.update_home(home, @invalid_attrs)
      assert home == Meeting.get_home!(home.id)
    end

    test "delete_home/1 deletes the home" do
      home = home_fixture()
      assert {:ok, %Home{}} = Meeting.delete_home(home)
      assert_raise Ecto.NoResultsError, fn -> Meeting.get_home!(home.id) end
    end

    test "change_home/1 returns a home changeset" do
      home = home_fixture()
      assert %Ecto.Changeset{} = Meeting.change_home(home)
    end
  end
end
