import gleam/float

pub fn score(x: Float, y: Float) -> Int {
  let assert Ok(r) = float.square_root(x *. x +. y *. y)

  case r {
    r if r <=. 1.0 -> 10
    r if r <=. 5.0 -> 5
    r if r <=. 10.0 -> 1
    _ -> 0
  }
}
