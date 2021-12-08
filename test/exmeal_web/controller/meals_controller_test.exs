defmodule Exmeal.MealsControllerTest do
  use ExmealWeb.ConnCase, async: true

  describe "create/2" do
    test "when all params are valid, creates a meal", %{conn: conn} do
      params = %{descricao: "Banana", data: "2001-05-02 00:00:00", calorias: "20"}

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:created)

      assert %{
               "meal" => %{
                 "calorias" => 20,
                 "data" => "2001-05-02T00:00:00",
                 "descricao" => "Banana",
                 "id" => _id
               },
               "message" => "Meal created!"
             } = response
    end

    test "when there are invalid params, returns an error", %{conn: conn} do
      params = %{descricao: "Banana"}

      expected_response = %{
        "message" => %{"calorias" => ["can't be blank"], "data" => ["can't be blank"]}
      }

      response =
        conn
        |> post(Routes.meals_path(conn, :create, params))
        |> json_response(:bad_request)

      assert response == expected_response
    end
  end

  describe "delete/2" do
    test "when id exist, delete the meal", %{conn: conn} do
      params = %{descricao: "Banana", data: "2001-05-02 00:00:00", calorias: "20"}

      {:ok, meal} = Exmeal.create_meal(params)

      id = meal.id

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> response(:no_content)

      assert "" = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id = "5e694bc0-78fc-4600-bcd0-0733b7540a6e"

      response =
        conn
        |> delete(Routes.meals_path(conn, :delete, id))
        |> json_response(:not_found)

      assert %{
               "message" => "Meal not found!"
             } = response
    end
  end

  describe "update/2" do
    test "when id exist, update the meal", %{conn: conn} do
      params = %{descricao: "Banana", data: "2001-05-02 00:00:00", calorias: "20"}

      {:ok, meal} = Exmeal.create_meal(params)

      id = meal.id

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calorias" => 20,
                 "data" => "2001-05-02T00:00:00",
                 "descricao" => "Banana",
                 "id" => _id
               }
             } = response
    end

    test "when not exist id, return an error", %{conn: conn} do
      id = "5e694bc0-78fc-4600-bcd0-0733b7540a6e"

      response =
        conn
        |> put(Routes.meals_path(conn, :update, id))
        |> json_response(:not_found)

      assert %{"message" => "Meal not found!"} = response
    end
  end

  describe "get/2" do
    test "when id exist, return the meal", %{conn: conn} do
      params = %{descricao: "Banana", data: ~N[2001-05-02 00:00:00], calorias: "20"}

      {:ok, meal} = Exmeal.create_meal(params)

      id = meal.id

      response =
        conn
        |> get(Routes.meals_path(conn, :show, id))
        |> json_response(:ok)

      assert %{
               "meal" => %{
                 "calorias" => 20,
                 "data" => "2001-05-02T00:00:00",
                 "descricao" => "Banana",
                 "id" => _id
               }
             } = response
    end

    test "when id not exist, return an error", %{conn: conn} do
      id = "5e694bc0-78fc-4600-bcd0-0733b7540a6e"

      response =
        conn
        |> get(Routes.meals_path(conn, :update, id))
        |> json_response(:not_found)

      assert %{"message" => "Meal not found!"} = response
    end
  end
end
