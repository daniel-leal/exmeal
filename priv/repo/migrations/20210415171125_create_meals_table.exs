defmodule Exmeal.Repo.Migrations.CreateMealsTable do
  use Ecto.Migration

  def change do
    create table(:meals) do
      add(:descricao, :string)
      add(:data, :utc_datetime)
      add(:calorias, :float)

      timestamps()
    end
  end
end
