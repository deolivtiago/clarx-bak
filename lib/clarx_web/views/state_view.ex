defmodule ClarxWeb.StateView do
  use ClarxWeb, :view
  alias ClarxWeb.StateView

  def render("index.json", %{states: states}) do
    %{data: render_many(states, StateView, "state.json")}
  end

  def render("show.json", %{state: state}) do
    %{data: render_one(state, StateView, "state.json")}
  end

  def render("state.json", %{state: state}) do
    %{
      id: state.id,
      name: state.name,
      code: state.code
    }
  end
end
