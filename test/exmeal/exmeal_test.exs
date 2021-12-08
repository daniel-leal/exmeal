defmodule Exmeal.MealTest do
  use Exmeal.DataCase

  alias Ecto.Changeset

  alias Exmeal.Meal

  describe "changeset/1" do
    test "when all params are valid, returns a valid changeset" do
      params = %{descricao: "Batata", data: "2021-12-04 23:00:00", calorias: 20}

      response = Meal.changeset(params)

      assert %Changeset{
               changes: %{descricao: "Batata", data: ~N[2021-12-04 23:00:00], calorias: 20},
               valid?: true
             } = response
    end
  end
end
