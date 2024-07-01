import gleam/int
import gleam/list
import gleam/pair
import gleam/string

pub fn convert(number: Int) -> String {
  let sounds =
    [#("Pling", 3), #("Plang", 5), #("Plong", 7)]
    |> list.filter(fn(sound) { number % sound.1 == 0 })
    |> list.map(pair.first)

  case sounds {
    [] -> int.to_string(number)
    _ -> string.concat(sounds)
  }
}
