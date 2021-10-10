defmodule ClarxWeb.StateController do
  use ClarxWeb, :controller

  alias Clarx.Geo
  alias Clarx.Geo.State

  action_fallback ClarxWeb.FallbackController

  def index(conn, %{"country_id" => country_id}) do
    country = Geo.get_country!(country_id)
    render(conn, "index.json", states: country.states)
  end

  def create(conn, %{"country_id" => country_id, "state" => state_params}) do
    country = Geo.get_country!(country_id)

    with {:ok, %State{} = state} <- Geo.create_state(country, state_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.country_state_path(conn, :show, country_id, state))
      |> render("show.json", state: state)
    end
  end

  def show(conn, %{"id" => id}) do
    state = Geo.get_state!(id)
    render(conn, "show.json", state: state)
  end

  def update(conn, %{"id" => id, "state" => state_params}) do
    state = Geo.get_state!(id)

    with {:ok, %State{} = state} <- Geo.update_state(state, state_params) do
      render(conn, "show.json", state: state)
    end
  end

  def delete(conn, %{"id" => id}) do
    state = Geo.get_state!(id)

    with {:ok, %State{}} <- Geo.delete_state(state) do
      send_resp(conn, :no_content, "")
    end
  end
end
