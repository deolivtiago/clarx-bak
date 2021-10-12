defmodule ClarxWeb.StateView do
  use ClarxWeb, :view
  alias ClarxWeb.{CityView, StateView}

  def render("index.json", %{states: states}) do
    %{data: render_many(states, StateView, "state.json")}
  end

  def render("show.json", %{state: state}) do
    %{data: render_one(state, StateView, "state_with_cities.json")}
  end

  def render("state_with_cities.json", %{state: state}) do
    %{
      id: state.id,
      name: state.name,
      code: state.code,
      cities: render_many(state.cities, CityView, "city.json")
    }
  end

  def render("state.json", %{state: state}) do
    %{
      id: state.id,
      name: state.name,
      code: state.code
    }
  end
end
