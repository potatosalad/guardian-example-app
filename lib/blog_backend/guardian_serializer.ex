defmodule BlogBackend.GuardianSerializer do
  @behaviour Guardian.Serializer

  def for_token(aud), do: {:ok, aud}

  def from_token(aud), do: {:ok, aud}
end