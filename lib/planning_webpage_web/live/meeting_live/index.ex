defmodule PlanningWebpageWeb.MeetingLive.Index do
  use PlanningWebpageWeb, :live_view

  alias PlanningWebpage.Pages
  alias PlanningWebpage.Pages.Meeting

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :meetings, Pages.list_meetings())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Meeting")
    |> assign(:meeting, Pages.get_meeting!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Meeting")
    |> assign(:meeting, %Meeting{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Meetings")
    |> assign(:meeting, nil)
  end

  @impl true
  def handle_info({PlanningWebpageWeb.MeetingLive.FormComponent, {:saved, meeting}}, socket) do
    {:noreply, stream_insert(socket, :meetings, meeting)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    meeting = Pages.get_meeting!(id)
    {:ok, _} = Pages.delete_meeting(meeting)

    {:noreply, stream_delete(socket, :meetings, meeting)}
  end
end
