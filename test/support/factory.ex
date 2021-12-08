defmodule Exmeal.Factory do
  use ExMachina.Ecto, repo: Exmeal.Repo

  alias Exmeal.Meal

  def meal_params_factory do
    %{
      calorias: 20,
      data: ~N[2001-05-02 00:00:00],
      descricao: "Banana"
    }
  end

  def meal_factory do
    %Meal{
      id: "5a99cd33-a5cc-44ca-91aa-1c1a43d00276",
      calorias: 20,
      data: ~N[2001-05-02 00:00:00],
      descricao: "Banana"
    }
  end
end
