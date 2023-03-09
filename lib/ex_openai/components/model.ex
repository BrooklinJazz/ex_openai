defmodule ExOpenAI.Components.Model do
  #  created: 1649880484,
  #  id: "text-davinci-insert-002",
  #  object: "model",
  #  owned_by: "openai",
  #  parent: nil,
  #  permission: [
  #    %{
  #      allow_create_engine: false,
  #      allow_fine_tuning: false,
  #      allow_logprobs: true,
  #      allow_sampling: true,
  #      allow_search_indices: false,
  #      allow_view: true,
  #      created: 1669066354,
  #      group: nil,
  #      id: "modelperm-V5YQoSyiapAf4km5wisXkNXh",
  #      is_blocking: false,
  #      object: "model_permission",
  #      organization: "*"
  #    }
  #  ],
  #  root: "text-davinci-insert-002"

  @type t :: %{
          created: integer,
          id: String.t(),
          object: String.t(),
          owned_by: String.t(),
          parent: String.t(),
          root: String.t(),
          permission: [
            %{
              allow_create_engine: boolean(),
              allow_fine_tuning: boolean(),
              allow_logprobs: boolean(),
              allow_sampling: boolean(),
              allow_search_indices: boolean(),
              allow_view: boolean(),
              created: integer,
              group: String.t(),
              id: String.t(),
              is_blocking: boolean(),
              object: String.t(),
              organization: String.t()
            }
          ]
        }

  defstruct [:created, :id, :object, :owned_by, :parent, :permission, :root]

  def unpack_ast(partial_tree \\ %{}) do
    with {:ok, type} <- Code.Typespec.fetch_types(__MODULE__) do
      tp =
        type
        |> List.first()
        |> Kernel.elem(1)
        |> Code.Typespec.type_to_quoted()

      Map.put(partial_tree, __MODULE__, tp)
    end
  end
end