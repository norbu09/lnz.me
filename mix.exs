defmodule LnzMe.MixFile do
  use Mix.Project

  def project do
    [
      app: :lnz_me,
      version: "0.1.0",
      elixir: "~> 1.12",
      start_permanent: Mix.env == :prod,
      deps: deps()
    ]
  end

  def application do
    [
      applications: [:serum]
    ]
  end

  defp deps do
    [
      {:serum, "~> 1.5"}
    ]
  end
end
