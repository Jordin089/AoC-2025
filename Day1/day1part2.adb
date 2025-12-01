with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure day1part2 is
    File       : File_Type;
    File_Name  : constant String := "day1input.txt";
    Current_Location      : Integer := 50;
    Location_Change       : Integer;
    Zero_Count            : Integer := 0;
    Times_Passed          : Integer;
    Previous_Location     : Integer;
    function Get_Input_Line (File : File_Type) return String is
    begin
        return Get_Line (File);
    end Get_Input_Line;
    
    function Get_Input_Number (Line : String) return Integer is
        First_Number_Index    : Integer := Line'first + 1;
        Final_Number_Index    : Integer := Line'last;
    begin
        return Integer'Value (Line(First_Number_Index .. Final_Number_Index));
    end;
begin
    Open (File, In_File, File_Name);
    while not End_Of_File (File) loop
        Declare
            Line : String := Get_Input_Line (File);
        Begin
            Location_Change := Get_Input_Number (Line);
            if Line(Line'first) = 'L' then
               Location_Change := Location_Change * (-1);
            end if;
            Current_Location := (Current_Location + Location_Change);
            if Current_Location <= 0 then
               Previous_Location := Current_Location + (Location_Change * (-1));
               if (Previous_Location) mod 100 = 0 then
                  Zero_Count := Zero_Count - 1;
                  Put_Line("Previous Location was 1");
               end if;
               Times_Passed := (Current_Location / (-100)) + 1;
               Zero_count := Zero_Count + Times_Passed;
            end if;
            if Current_Location >= 100 then
               Times_Passed := (Current_Location / 100);
               Zero_count := Zero_Count + Times_Passed;
            end if;
            Put_Line (Line);
            Put_Line ("Times Passed: " & Times_Passed'Image);
            Put_Line ("Zero Count: " & Zero_Count'Image);
            Put_Line ("Current Location: " & Current_Location'Image);
            Current_Location := Current_Location mod 100;
            Put_Line ("Official Current Location: " & Current_Location'Image);
        End;
    end loop;
    Put_Line (Zero_Count'image);
    Close (File);
end day1part2;
