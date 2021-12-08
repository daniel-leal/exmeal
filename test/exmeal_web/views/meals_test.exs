defmodule ExmealWeb.MealsViewTest do
  use ExmealWeb.ConnCase, async: true

  import Phoenix.View

  alias Exmeal.Meal

  alias ExmealWeb.MealsView

  test "render create.json" do
    params = %{descricao: "Banana", data: "2001-05-02 00:00:00", calorias: "20"}
    {_ok, meal} = Exmeal.create_meal(params)

    response = render(MealsView, "create.json", meal: meal)

    assert %{
             meal: %Meal{
               calorias: 20,
               data: ~N[2001-05-02 00:00:00],
               descricao: "Banana",
               id: _id
             },
             message: "Meal created!"
           } = response
  end

  test "render meal.json" do
    params = %{descricao: "Banana", data: "2001-05-02 00:00:00", calorias: "20"}
    {_ok, meal} = Exmeal.create_meal(params)

    response = render(MealsView, "meal.json", meal: meal)

    assert %{
             meal: %Meal{
               calorias: 20,
               data: ~N[2001-05-02 00:00:00],
               descricao: "Banana",
               id: _id
             }
           } = response
  end
end
