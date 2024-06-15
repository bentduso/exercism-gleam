import gleam/list

pub type Pizza {
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}

pub fn pizza_price(pizza: Pizza) -> Int {
  do_pizza_price(pizza, 0)
}

fn do_pizza_price(pizza: Pizza, acc: Int) -> Int {
  case pizza {
    Margherita -> acc + 7
    Caprese -> acc + 9
    Formaggio -> acc + 10
    ExtraSauce(pizza) -> do_pizza_price(pizza, acc + 1)
    ExtraToppings(pizza) -> do_pizza_price(pizza, acc + 2)
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let base_price = do_order_price(order, 0)
  let additional_price = case list.length(order) {
    1 -> 3
    2 -> 2
    _ -> 0
  }

  base_price + additional_price
}

fn do_order_price(order: List(Pizza), acc: Int) -> Int {
  case order {
    [] -> acc
    [pizza, ..tail] -> do_order_price(tail, acc + pizza_price(pizza))
  }
}
