import gleam/list
import gleam/string

pub fn slices(input: String, size: Int) -> Result(List(String), Error) {
  case validate_input(input, size) {
    Error(error) -> Error(error)
    Ok(_) ->
      input
      |> string.to_graphemes()
      |> list.window(size)
      |> list.map(string.join(_, ""))
      |> Ok()
  }
}

fn validate_input(input: String, size: Int) -> Result(Nil, Error) {
  let length = string.length(input)

  case length, size {
    0, _ -> Error(EmptySeries)
    _, 0 -> Error(SliceLengthZero)
    _, size if size < 0 -> Error(SliceLengthNegative)
    length, size if size > length -> Error(SliceLengthTooLarge)
    _, _ -> Ok(Nil)
  }
}

pub type Error {
  SliceLengthTooLarge
  SliceLengthZero
  SliceLengthNegative
  EmptySeries
}
