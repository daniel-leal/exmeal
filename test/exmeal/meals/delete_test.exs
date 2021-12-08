defmodule Exmeal.Meals.DeleteTest do
  use Exmeal.DataCase

  import Exmeal.Factory

  alias Exmeal.Meal
  alias Exmeal.Error
  alias Exmeal.Meals.{Create, Delete}

  describe "Delete Meal" do
    setup do
      params = build(:meal_params)

      {:ok, %Meal{id: id}} = Create.call(params)

      {:ok, id: id}
    end

    test "when a valid id is given, returns the meal", %{id: id} do
      response = Delete.call(id)

      assert {:ok,
              %Exmeal.Meal{
                calorias: 20,
                data: ~N[2001-05-02 00:00:00],
                descricao: "Banana",
                id: _id,
                inserted_at: _inserted_at,
                updated_at: _updated_at
              }} = response
    end

    test "when an invalid id is given, returns an error" do
      id = "a6ef9b39-d638-4835-9ad7-dbe48d1257eb"
      response = Delete.call(id)

      assert {:error, %Error{result: "Meal not found!", status: :not_found}} = response
    end
  end
end
