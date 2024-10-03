import gleam/list
import gleam/string

pub fn is_isogram(phrase phrase: String) -> Bool {
  let normalized_graphemes =
    phrase
    |> string.lowercase
    |> string.replace(" ", "")
    |> string.replace("-", "")
    |> string.to_graphemes

  normalized_graphemes
  |> list.length
  == normalized_graphemes
  |> list.unique
  |> list.length
}
