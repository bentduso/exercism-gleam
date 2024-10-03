import gleam/list
import gleam/set
import gleam/string

const alphabet = "abcdefghijklmnopqrstuvwxyz"

pub fn is_pangram(sentence: String) -> Bool {
  sentence
  |> string.lowercase
  |> string.to_graphemes
  |> list.filter(fn(char) { string.contains(alphabet, char) })
  |> set.from_list
  |> set.size
  == 26
}
