module type PLACES =
sig
  val cities : (string) list
end

module Places : PLACES =
struct
  let cities = ["Brest";
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
		"Le Mans";
		"Liege";
		"Brussels";
		"Amsterdam";
		"Cologne";
		"Essen";
		"London"]
end
