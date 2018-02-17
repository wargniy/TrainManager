module type DATA =
sig
  type train = (string * string * int)
  val distance : train list
  val get_start : train -> string
  val get_finish : train -> string
  val get_lenght : train -> int
end

module Data : DATA =
struct
  type train = (string * string * int)
  let distance = [("Paris", "Lyon", 427);
		  ("Dijon", "Lyon", 192);
		  ("Paris", "Lille", 225);
		  ("Paris", "Nancy", 327);
		  ("Dijon", "Nancy", 226);
		  ("Brest", "Rennes", 248);
		  ("Lille", "London", 269);
		  ("Liege", "Cologne", 118);
		  ("Le Mans", "Paris", 201);
		  ("Cologne", "Essen", 81);
		  ("Lyon", "Marseille", 325);
		  ("Brussels", "Liege", 104);
		  ("Paris", "LeHavre", 230);
		  ("Rennes", "LeMans", 163);
		  ("LeMans", "Nantes", 183);
		  ("Paris", "Bordeaux", 568);
		  ("Lille", "Brussels", 106);
		  ("Nancy", "Strasbourg", 149);
		  ("Paris", "Strasbourg", 449);
		  ("Dijon", "Strasbourg", 309);
		  ("Toulouse", "Bordeaux", 256);
		  ("Brussels", "Amsterdam", 211);
		  ("Montpellier", "Toulouse", 248);
		  ("Marseille", "Montpellier", 176)]

  let get_start (s, _, _) = s
  let get_finish (_, f, _) = f
  let get_lenght (_, _, l) = l
end
