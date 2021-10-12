defmodule ClarxWeb.CityController do
  use ClarxWeb, :controller

  alias Clarx.Geo
  alias Clarx.Geo.City

  action_fallback ClarxWeb.FallbackController

  def index(conn, %{"state_id" => state_id}) do
    state = Geo.get_state!(state_id)
    render(conn, "index.json", cities: state.cities)
  end

  # def create(conn, attrs) do
  #   attrs
  #   |> IO.inspect()
  # end

  def create(conn, %{"country_id" => country_id, "state_id" => state_id, "city" => city_params}) do
    # country = Geo.get_country!(country_id)
    state = Geo.get_state!(state_id)

    with {:ok, %City{} = city} <- Geo.create_city(state, city_params) do
      conn
      |> put_status(:created)
      |> put_resp_header(
        "location",
        Routes.country_state_city_path(conn, :show, country_id, state_id, city)
      )
      |> render("show.json", city: city)
    end
  end

  def show(conn, %{"id" => id}) do
    city = Geo.get_city!(id)
    render(conn, "show.json", city: city)
  end

  def update(conn, %{"id" => id, "city" => city_params}) do
    city = Geo.get_city!(id)

    with {:ok, %City{} = city} <- Geo.update_city(city, city_params) do
      render(conn, "show.json", city: city)
    end
  end

  def delete(conn, %{"id" => id}) do
    city = Geo.get_city!(id)

    with {:ok, %City{}} <- Geo.delete_city(city) do
      send_resp(conn, :no_content, "")
    end
  end
end
