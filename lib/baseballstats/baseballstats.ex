defmodule Baseballstats.App do
  use Application

  def start(_type, _args) do
    import Supervisor.Spec
    tree = [supervisor(Baseballstats.Repo, [])]
    opts = [name: Baseballstats.Sup, strategy: :one_for_one]
    ret = Supervisor.start_link(tree, opts)

    filename = "master.csv"
    player_records = Baseballstats.PlayerCsv.parse(filename)
    Enum.each(player_records, fn(player_record) ->
      # changeset = User.changeset(%User{}, %{age: 42, email: "mary@example.com"})
      changeset = Baseballstats.Player.changeset(%Baseballstats.Player{}, player_record)
      Baseballstats.Repo.insert!(changeset)
    end)
    ret
  end

end
