defmodule CliTest do
  use ExUnit.Case

  import Baseballstats.CLI, only: [ parse_args: 1 ]

  test ":help returned by option parsing with -h and --help options" do
    assert parse_args(["-h", "anything"]) === :help
    assert parse_args(["--help", "anything"]) === :help
  end
end

