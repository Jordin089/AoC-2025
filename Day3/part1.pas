program part1;

type
   value = record
              value : integer;
              index : integer;
           end;
const
   filename = './input.txt';
var
   line         : string;
   input_file   : text;
   total        : integer;
   first_value   : value;
   second_value : value;

function max_on_range(line : string; starting_index : integer; final_index : integer;): integer;
var
   current_highest : value;
   i               : integer;
   character       : string;
   value           : integer;
begin
   current_highest.value := 0;
   current_highest.index := 0;
   for i:= starting_index to final_index do
      begin
         character := line[i];
         value := StrToInt(character);
         if (value > current_highest.value) then
            begin
               current_highest.value := value;
               current_highest.index ;= i;
            end;
      end;
end;
         
         
end;
begin
   total := 0;
   Assign(input_file, filename);
   Reset(input_file);
   repeat
      ReadLn(input_file, line);
      WriteLn('length: ', length(line));
      WriteLn(line);
      
   until eof(input_file);
   Close(input_file);
end.
