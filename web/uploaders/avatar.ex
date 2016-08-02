defmodule Callme.Avatar do
  use Arc.Definition
 use Arc.Ecto.Definition
  # Include ecto support (requires package arc_ecto installed):
  # use Arc.Ecto.Definition
  @versions [:original, :thumb]
  @extension_whitelist ~w(.jpg .jpeg .gif .png)

  def acl(:thumb, _), do: :public_read

  def validate({file, _}) do   
    file_extension = file.file_name |> Path.extname |> String.downcase
    Enum.member?(@extension_whitelist, file_extension)
  end

  def transform(:thumb, _) do
    {:convert, "-strip -thumbnail 125x200^ -gravity center -extent 100x100"}
  end

  def filename(version, {file, scope}) do
  "#{scope.id}_#{version}_#{file.file_name}"
    end

  def storage_dir(_, {file, user}) do
    "uploads/avatars/#{user.id}"
  end

  def default_url(:thumb) do
    "https://placehold.it/100x100"
  end
end