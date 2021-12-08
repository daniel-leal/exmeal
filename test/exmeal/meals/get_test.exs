defmodule Exmeal.Meals.GetTest do
  use Exmeal.DataCase, async: true

  import Exmeal.Factory

  alias Exmeal.{Error, Meal}

  describe "Get Meal" do
    test "when the meal exists, returns the meal" do
      params = build(:meal_params)
      {:ok, %Meal{id: id}} = Exmeal.create_meal(params)

      response = Exmeal.get_meal_by_id(id)

      assert {:ok,
              %Meal{
                calorias: _cal,
                data: _date,
                descricao: "Banana",
                id: _id,
                inserted_at: _inserted_at,
                updated_at: _updated_at
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Exmeal.get_meal_by_id(id)

      assert {:error, %Error{result: "Meal not found!", status: :not_found}} = response
    end
  end
end
