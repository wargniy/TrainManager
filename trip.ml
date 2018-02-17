module type TRIP =
sig
  type voyage = (string * int * int * string * string * string list)
  val create_voyage : string list -> (string * int * int * string * string * string list)
  val get_train : voyage -> string
  val get_id : voyage -> int
  val get_speed : voyage -> int
  val get_date : voyage ->string
  val get_time : voyage -> string
  val get_places : voyage -> string list
  val get_voyage : string -> int -> int -> string ->  string -> string list -> voyage
end

module type MAKETRIP = functor (Train : Train.TRAIN) (Data : Data.DATA) (Places : Places.PLACES) -> TRIP

module MakeTrip : MAKETRIP = functor (Train: Train.TRAIN) (Data: Data.DATA) (Places : Places.PLACES) ->
struct
  type voyage = (string * int * int * string * string * string list)
  let get_train (train, _, _, _, _, _) = train
  let get_id (_, id, _, _, _, _) = id
  let get_speed (_, _, speed, _, _, _) = speed
  let get_date (_, _, _, date, _, _) = date
  let get_time (_, _, _, _, time, _) = time
  let get_places (_, _, _, _, _, places) = places
  let get_voyage train id speed date time places = (train, id, speed, date, time, places)

  let create_voyage list =
      let a = ((Random.int 8999) + 1000)
      in
      begin
	Printf.printf "Trip created: %s %d\n" (List.nth list 0) (a);
	(get_voyage (List.nth list 0) (a) (Train.speed (List.nth list 0)) (List.nth list 1) (List.nth list 2) (Str.split (Str.regexp ",") (List.nth list 3)));
      end
end
