program part1;

uses sysutils;
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

function max_on_range(line : string; starting_index : integer; final_index : integer): value;
var
   result    : value;
   i         : integer;
   character : string;
   value     : integer;
begin
   result.value := 0;
   result.index := 0;
   for i:= starting_index to final_index do
      begin
         character := line[i];
         value := StrToInt(character);
         if (value > result.value) then
            begin
               result.value := value;
               result.index := i;
            end;
      end;
   max_on_range := result;
end;
         
begin
   total := 0;
   Assign(input_file, filename);
   Reset(input_file);
   repeat
      begin
         ReadLn(input_file, line);
         first_value := max_on_range(line, 1, length(line) - 1);
         second_value := max_on_range(line, first_value.index + 1, length(line));
         WriteLn('value for this line: ', first_value.value*10 + second_value.value);
         total := total + (first_value.value*10) + second_value.value;
      end;
   until eof(input_file);
   Close(input_file);
   WriteLn('total Value: ', total)
end.
