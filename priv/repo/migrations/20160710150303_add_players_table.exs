defmodule Baseballstats.Repo.Migrations.AddPlayersTable do
  use Ecto.Migration

  def change do
    create table(:players) do
      add :playerID, :string
      add :birthYear, :integer
      add :birthMonth, :integer
      add :birthDay, :integer
      add :birthCountry, :string
      add :birthState, :string
      add :birthCity, :string
      add :deathYear, :integer
      add :deathMonth, :integer
      add :deathDay, :integer
      add :deathCountry, :string
      add :deathState, :string
      add :deathCity, :string
      add :nameFirst, :string
      add :nameLast, :string
      add :nameGiven, :string
      add :weight, :integer
      add :height, :integer
      add :bats, :string
      add :throws, :string
      add :debut, :string
      add :finalGame, :string
      add :retroID, :string
      add :bbrefID, :string
      timestamps
    end
    create index(:players, [:playerID])
  end
end


