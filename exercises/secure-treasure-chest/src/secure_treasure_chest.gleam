import gleam/string

pub opaque type TreasureChest(a) {
  TreasureChest(password: String, treasure: a)
}

pub fn create(
  password: String,
  contents: treasure,
) -> Result(TreasureChest(treasure), String) {
  case string.length(password) < 8 {
    True -> Error("Password must be at least 8 characters long")
    _ -> Ok(TreasureChest(password: password, treasure: contents))
  }
}

pub fn open(
  chest: TreasureChest(treasure),
  password: String,
) -> Result(treasure, String) {
  case chest.password == password {
    True -> Ok(chest.treasure)
    _ -> Error("Incorrect password")
  }
}
