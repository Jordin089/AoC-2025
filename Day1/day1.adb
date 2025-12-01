with Ada.Text_IO; use Ada.Text_IO;
with Ada.Strings.Fixed; use Ada.Strings.Fixed;

procedure day1 is
    File       : File_Type;
    File_Name  : constant String := "day1input.txt";
    Current_Location      : Integer := 50;
    Location_Change       : Integer;
    Zero_Count            : Integer := 0;

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
            Current_Location := (Current_Location + Location_Change) mod 100;
            if Current_Location = 0 then
               Zero_Count := Zero_Count + 1;
            end if;
        End;
    end loop;
    Put_Line (Zero_Count'image);
    Close (File);
end day1;
