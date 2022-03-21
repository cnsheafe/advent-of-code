defmodule Input do
  def read(filename) do
    case File.read(filename) do
      {:ok, bin_text} -> parse_lines(bin_text)
      {:error, posix} -> throw("Error in reading input: #{Application.format_error(posix)}")
    end
  end

  defp parse_lines(bin_text) do
    bin_text
    |> String.split("\n", trim: true)
  end
end
