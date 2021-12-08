defmodule Exmeal.Meals.CreateTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.{Error, Meal}

  describe "Create Meal" do
    test "when all params are valid, returns the meal" do
      params = build(:meal_params)

      response = Exmeal.create_meal(params)

      assert {:ok,
              %Meal{
                calorias: 20,
                data: ~N[2001-05-02 00:00:00],
                descricao: "Banana",
                id: _id
              }} = response
    end

    test "when there are invalid params, returns an error" do
      params = %{
        calorias: 20,
        data: ~N[2001-05-02 00:00:00]
      }

      response = Exmeal.create_meal(params)

      assert {:error, %Error{}} = response
    end
  end
end
