defmodule PersonInfo.Repo.Migrations.CreatePersons do
  use Ecto.Migration

  def change do
    create table(:persons) do
      add :name, :string
      add :role, :string
      add :avatar, :string

      timestamps()
    end

  end
end
