defmodule LooksLike.MixProject do
  use Mix.Project

  @version "0.1.1"

  @source_url "https://github.com/supersimple/looks_like"
  def project do
    [
      app: :looks_like,
      version: @version,
      elixir: "~> 1.12",
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      docs: docs(),
      deps: deps(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:ex_doc, "~> 0.31", only: :dev, runtime: false}
    ]
  end

  defp description do
    """
    A library for checking if a string looks like an ip address or lat/long.
    """
  end

  defp package do
    [
      name: "looks_like",
      maintainers: ["supersimple"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url},
      files: ["lib", "mix.exs", "README.md"],
    ]
  end

  defp docs do
    [
      main: "LooksLike",
      source_ref: @source_url
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]
end
