pub fn to_rna(dna: String) -> Result(String, Nil) {
  do_to_rna(dna, "")
}

fn do_to_rna(dna: String, acc: String) -> Result(String, Nil) {
  case dna {
    "" -> Ok(acc)
    "G" <> rest -> do_to_rna(rest, acc <> "C")
    "C" <> rest -> do_to_rna(rest, acc <> "G")
    "T" <> rest -> do_to_rna(rest, acc <> "A")
    "A" <> rest -> do_to_rna(rest, acc <> "U")
    _ -> Error(Nil)
  }
}
