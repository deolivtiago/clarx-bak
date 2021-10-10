defmodule ClarxWeb.CountryView do
  use ClarxWeb, :view
  alias ClarxWeb.{CountryView, StateView}

  def render("index.json", %{countries: countries}) do
    %{data: render_many(countries, CountryView, "country.json")}
  end

  def render("show.json", %{country: country}) do
    %{data: render_one(country, CountryView, "country_with_states.json")}
  end

  def render("country_with_states.json", %{country: country}) do
    %{
      id: country.id,
      name: country.name,
      code: country.code,
      states: render_many(country.states, StateView, "state.json")
    }
  end

  def render("country.json", %{country: country}) do
    %{
      id: country.id,
      name: country.name,
      code: country.code
    }
  end
end
