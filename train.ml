module type TRAIN =
sig
  val tgv : (string) list
  val thalys : (string) list
  val eurostar : (string) list
  val speed : (string) -> int
end

module Train : TRAIN =
struct
  let tgv = ["Brest";
	     "Le Havre";
	     "Lille";
	     "Paris";
	     "Strasbourg";
	     "Nancy";
	     "Dijon";
	     "Lyon";
	     "Nice";
	     "Marseille";
	     "Montpellier";
	     "Perpignan";
	     "Bordeaux";
	     "Nantes";
	     "Avignon";
	     "Rennes";
	     "Biarritz";
	     "Toulouse";
	     "Le Mans"]
  let thalys = ["Paris";
		"Lille";
		"Liege";
		"Brussels";
		"Amsterdam";
		"Cologne";
		"Essen"]
  let eurostar = ["Paris";
		  "London";
		  "Brussels";
		  "Lille"]
  let speed str =
    begin
      if (str = "tgv") then (230)
      else if (str = "thalys") then (210)
      else if (str = "eurostar") then (160)
      else (0);
    end
end
