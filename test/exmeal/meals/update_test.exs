defmodule Exmeal.Meals.UpdateTest do
  use Exmeal.DataCase

  describe "Update Meal" do
    test "when a valid id is given, returns the meal" do
      params = %{
        calorias: 20,
        data: ~N[2001-05-02 00:00:00],
        descricao: "Banana"
      }

      {_ok, meal} = Exmeal.create_meal(params)

      response = Exmeal.update_meal(%{"id" => meal.id, "calorias" => 25})

      assert {:ok,
              %Exmeal.Meal{
                calorias: 25,
                data: ~N[2001-05-02 00:00:00],
                descricao: "Banana",
                id: _id
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Exmeal.update_meal(%{"id" => id})

      assert {:error, %Exmeal.Error{result: "Meal not found!", status: :not_found}} = response
    end
  end
end
