import gleam/int
import gleam/list

pub fn is_armstrong_number(number: Int) -> Bool {
  number == calculate_armstrong_number(number)
}

fn calculate_armstrong_number(number: Int) -> Int {
  let assert Ok(digits) = int.digits(number, 10)
  digits
  |> list.map(fn(x) { pow(x, list.length(digits)) })
  |> int.sum
}

fn pow(base: Int, exponent: Int) -> Int {
  do_pow(base, exponent, 1)
}

fn do_pow(base: Int, exponent: Int, acc: Int) -> Int {
  case exponent {
    0 -> acc
    _ -> do_pow(base, exponent - 1, acc * base)
  }
}
