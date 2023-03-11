defmodule Mix.Tasks.UpdateOpenaiDocs do
  @moduledoc """
  Updates OpenAI API documentation files
  """

  use Mix.Task

  @impl Mix.Task

  @target_dir "lib/ex_openai/docs"
  def run(_) do
    File.mkdir_p!(@target_dir)
    docs_url = "https://raw.githubusercontent.com/openai/openai-openapi/master/openapi.yaml"
    args = ["-L", docs_url, "-o", "#{@target_dir}/docs.yaml"]
    IO.inspect(args)
    System.cmd("curl", args)
  end
end
