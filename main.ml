let delete str list =
  match list with
    | ("", 0, 0, "", "", []) -> ("", 0, 0, "", "", [])
    | (train, id, vit, date, hour, places) ->
      if ((String.concat train [(Pervasives.string_of_int id)]) = str)
      then
	begin
	  ("", 0, 0, "", "", [])
	end
      else
	begin
	  list
	end

let rec print_cities data list old_date time =
  match data with
    | ("", 0, 0, "", "", []) -> ()
    | (train, id, vit, date, hour, places) ->
      if (date = old_date && hour = time) then
	begin
	  Printf.printf "%s (,) (%s,%s)\n" (List.hd list) (old_date) (time);
	  print_cities data (List.tl list) ("") ("")
	end
      else if (List.tl list = []) then
	begin
	  Printf.printf "%s (%s,%s) (,)\n" (List.hd list) (date) (hour);
	  end
      else
	begin
	  Printf.printf "%s (%s,%s) (%s,%s)\n" (List.hd list) (date) (hour) (date) (hour);
	  print_cities data (List.tl list) ("") ("")
	end


let print_list list =
  match list with
    | ("", 0, 0, "", "", []) -> ()
    | (train, id, vit, date, hour, places) ->
      begin
	Printf.printf "%s %d\n" train id;
	print_cities (train, id, vit, date, hour, places) places date hour
      end

let rec main list =
  let str = try read_line ()
    with End_of_file -> exit 0
  in
  if (str = "quit") then (exit 0)
  else
    match ((Str.split (Str.regexp " ") str)) with
      | [] -> main list
      | hd::tl ->
	if (hd = "create") then
	  begin
	    let module Save = Trip.MakeTrip (Train.Train) (Data.Data) (Places.Places)
	    in
	    match list with
	      | ("", 0, 0, "", "", []) ->
		begin
		  main (Save.create_voyage tl)
		end
	      | _ -> main list
	  end
	else if (hd ="delete") then
	    main ("", 0, 0, "", "", [])
	else if (hd = "list") then
	  begin
	    print_list list;
	    main list
	  end
	else
	  begin
	    main list
	  end;;

main ("", 0, 0, "", "", []);;
