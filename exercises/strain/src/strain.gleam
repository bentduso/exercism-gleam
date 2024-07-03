import gleam/list

pub fn keep(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  do_keep(list, predicate, [])
}

fn do_keep(list: List(t), predicate: fn(t) -> Bool, acc: List(t)) {
  case list {
    [] -> list.reverse(acc)
    [x, ..xs] ->
      case predicate(x) {
        True -> do_keep(xs, predicate, [x, ..acc])
        _ -> do_keep(xs, predicate, acc)
      }
  }
}

pub fn discard(list: List(t), predicate: fn(t) -> Bool) -> List(t) {
  keep(list, fn(t) { !predicate(t) })
}
