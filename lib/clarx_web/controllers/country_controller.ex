defmodule ClarxWeb.CountryController do
  use ClarxWeb, :controller

  alias Clarx.Geo
  alias Clarx.Geo.Country

  action_fallback ClarxWeb.FallbackController

  def index(conn, _params) do
    countries = Geo.list_countries()
    render(conn, "index.json", countries: countries)
  end

  def create(conn, %{"country" => country_params}) do
    with {:ok, %Country{} = country} <- Geo.create_country(country_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.country_path(conn, :show, country))
      |> render("show.json", country: country)
    end
  end

  def show(conn, %{"id" => id}) do
    country = Geo.get_country!(id)
    render(conn, "show.json", country: country)
  end

  def update(conn, %{"id" => id, "country" => country_params}) do
    country = Geo.get_country!(id)

    with {:ok, %Country{} = country} <- Geo.update_country(country, country_params) do
      render(conn, "show.json", country: country)
    end
  end

  def delete(conn, %{"id" => id}) do
    country = Geo.get_country!(id)

    with {:ok, %Country{}} <- Geo.delete_country(country) do
      send_resp(conn, :no_content, "")
    end
  end
end
