-------------------------------------------------------------------------------
--                                                                           --
--                    C _ M A L E F - C O L O R S . A D B                    --
--                                                                           --
--                                 M A L E F                                 --
--                                                                           --
--                                  B O D Y                                  --
--                                                                           --
-------------------------------------------------------------------------------
--     Copyright (c) 2021 José Antonio Verde Jiménez All Rights Reserved     --
-------------------------------------------------------------------------------
-- This file is part of Malef.                                               --
--                                                                           --
-- This program is free software:  you  can redistribute it and/or modify it --
-- under  the terms  of the  GNU  General License  as published by the  Free --
-- Software  Foundation,  either  version 3  of  the  License,  or  (at your --
-- opinion) any later version.                                               --
--                                                                           --
-- This  program  is distributed  in the  hope that  it will be  useful, but --
-- WITHOUT   ANY   WARRANTY;   without   even  the   implied   warranty   of --
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General --
-- Public License for more details.                                          --
--                                                                           --
-- You should have received  a copy of the  GNU General Public License along --
-- with this program. If not, see <https://www.gnu.org/licenses/>.           --
--                                                                           --
-------------------------------------------------------------------------------


package body C_Malef.Colors is

   procedure Get_Foreground (Surface :    Surface_Type;
                             Row     :     Row_Type;
                             Col     :     Col_Type;
                             Color   : out Color_Type) is
   begin

      Color := To_C(Malef.Colors.Get_Foreground(
                     Surface => Surface.Object,
                     Row     => Malef.Row_Type(Row),
                     Col     => Malef.Col_Type(Col)));

   end Get_Foreground;


   procedure Get_Background (Surface :     Surface_Type;
                             Row     :     Row_Type;
                             Col     :     Col_Type;
                             Color   : out Color_Type) is
   begin

      Color := To_C(Malef.Colors.Get_Background(
                     Surface => Surface.Object,
                     Row     => Malef.Row_Type(Row),
                     Col     => Malef.Col_Type(Col)));

   end Get_Background;



   procedure Set_Foreground (Surface  : Surface_Type;
                             From_Row : Row_Type;
                             To_Row   : Row_Type;
                             From_Col : Col_Type;
                             To_Col   : Col_Type;
                             Color    : Color_Type) is
   begin

      Malef.Colors.Set_Foreground(Surface  => Surface.Object,
                                  From_Row => Malef.Row_Type(From_Row),
                                  To_Row   => Malef.Row_Type(To_Row),
                                  From_Col => Malef.Col_Type(From_Col),
                                  To_Col   => Malef.Col_Type(To_Col),
                                  Color    => To_Ada(Color));

   end Set_Foreground;


   procedure Set_Background (Surface  : Surface_Type;
                             From_Row : Row_Type;
                             To_Row   : Row_Type;
                             From_Col : Col_Type;
                             To_Col   : Col_Type;
                             Color    : Color_Type) is
   begin

      Malef.Colors.Set_Background(Surface  => Surface.Object,
                                  From_Row => Malef.Row_Type(From_Row),
                                  To_Row   => Malef.Row_Type(To_Row),
                                  From_Col => Malef.Col_Type(From_Col),
                                  To_Col   => Malef.Col_Type(To_Col),
                                  Color    => To_Ada(Color));

   end Set_Background;




   procedure Get_Cursor_Foreground (Surface :     Surface_Type;
                                    Color   : out Color_Type) is
   begin

      Color := To_C(Malef.Colors.Get_Cursor_Foreground(Surface.Object));

   end Get_Cursor_Foreground;


   procedure Get_Cursor_Background (Surface :     Surface_Type;
                                    Color   : out Color_Type) is
   begin

      Color := To_C(Malef.Colors.Get_Cursor_Background(Surface.Object));

   end Get_Cursor_Background;



   procedure Set_Cursor_Foreground (Surface : Surface_Type;
                                    Color   : Color_Type) is
   begin

      Malef.Colors.Set_Cursor_Foreground(Surface => Surface.Object,
                                         Color   => To_Ada(Color));

   end Set_Cursor_Foreground;


   procedure Set_Cursor_Background (Surface : Surface_Type;
                                    Color   : Color_Type) is
   begin

      Malef.Colors.Set_Cursor_Background(Surface => Surface.Object,
                                         Color   => To_Ada(Color));

   end Set_Cursor_Background;



   procedure Get_Palette (Palette : out Palette_Type) is
   begin

      Palette := To_C(Malef.Colors.Get_Palette);

   end Get_Palette;


   procedure Get_Palette (Kind    :     Palette_Kind;
                          Palette : out Palette_Type) is
   begin

      Palette := To_C(Malef.Colors.Palettes(To_Ada(Kind)));

   end Get_Palette;


   procedure Set_Palette (Palette : Palette_Type) is
   begin

      Malef.Colors.Set_Palette(To_Ada(Palette));

   end Set_Palette;


   procedure Set_Palette (Kind : Palette_Kind) is
   begin

      Malef.Colors.Set_Palette(To_Ada(Kind));

   end Set_Palette;


-- PRIVATE --

   function To_Ada (Item : Color_Type)
                    return Malef.Color_Type is
   begin

      return New_Color : Malef.Color_Type
      do
         New_Color := (Malef.R => Malef.Color_Component_Type(Item(R)),
                       Malef.G => Malef.Color_Component_Type(Item(G)),
                       Malef.B => Malef.Color_Component_Type(Item(B)),
                       Malef.A => Malef.Color_Component_Type(Item(A)));
      end return;

   end To_Ada;


   function To_C (Item : Malef.Color_Type)
                  return Color_Type is
   begin

      return New_Color : Color_Type
      do
         New_Color := (R => C_Malef.Color_Component_Type(Item(Malef.R)),
                       G => C_Malef.Color_Component_Type(Item(Malef.G)),
                       B => C_Malef.Color_Component_Type(Item(Malef.B)),
                       A => C_Malef.Color_Component_Type(Item(Malef.A)));
      end return;

   end To_C;


   boolAda2C : constant array (Boolean'Range) of bool :=
      (False => false,
       True  => true);
   boolC2Ada : constant array (bool'Range) of Boolean :=
      (false => False,
       True  => true);

   colorKindAda2C : constant array (Malef.Colors.Color_Kind'Range)
                             of Color_Kind :=
      (Malef.Colors.Black   => Black,
       Malef.Colors.Red     => Red,
       Malef.Colors.Green   => Green,
       Malef.Colors.Yellow  => Yellow,
       Malef.Colors.Blue    => Blue,
       Malef.Colors.Magenta => Magenta,
       Malef.Colors.Cyan    => Cyan,
       Malef.Colors.White   => White);

   colorKindC2Ada : constant array (Color_Kind'Range)
                             of Malef.Colors.Color_Kind :=
      (Black   => Malef.Colors.Black,
       Red     => Malef.Colors.Red,
       Green   => Malef.Colors.Green,
       Yellow  => Malef.Colors.Yellow,
       Blue    => Malef.Colors.Blue,
       Magenta => Malef.Colors.Magenta,
       Cyan    => Malef.Colors.Cyan,
       White   => Malef.Colors.White);


   function To_Ada (Item : Palette_Type)
                    return Malef.Colors.Palette_Type is
      lastBool  : bool;
   begin

      return New_Palette : Malef.Colors.Palette_Type
      do
         for B in New_Palette'Range(1) loop
            lastBool := boolAda2C(B);
            for C in New_Palette'Range(2) loop
               New_Palette(B, C) := To_Ada(Item(lastBool, colorKindAda2C(C)));
            end loop;
         end loop;
      end return;

   end To_Ada;


   function To_C (Item : Malef.Colors.Palette_Type)
                    return Palette_Type is
      Last_Boolean : Boolean;
   begin

      return New_Palette : Palette_Type
      do
         for B in New_Palette'Range(1) loop
            Last_Boolean := boolC2Ada(B);
            for C in New_Palette'Range(2) loop
               New_Palette(B, C) := To_C(Item(Last_Boolean,colorKindC2Ada(C)));
            end loop;
         end loop;
      end return;

   end To_C;


   paletteKindAda2C : constant array (Malef.Colors.Palette_Kind'Range)
                               of Palette_Kind :=
      (Malef.Colors.Malef_Palette      => Malef_Palette,
       Malef.Colors.VGA                => VGA,
       Malef.Colors.Windows_XP_Console => Windows_XP_Console,
       Malef.Colors.Windows_PowerShell => Windows_PowerShell,
       Malef.Colors.Visual_Studio_Code => Visual_Studio_Code,
       Malef.Colors.Windows_10_Console => Windows_10_Console,
       Malef.Colors.Terminal_App       => Terminal_App,
       Malef.Colors.PuTTY              => PuTTY,
       Malef.Colors.mIRC               => mIRC,
       Malef.Colors.xterm              => xterm,
       Malef.Colors.Ubuntu             => Ubuntu);

   paletteKindC2Ada : constant array (Palette_Kind'Range)
                               of Malef.Colors.Palette_Kind :=
      (Malef_Palette      => Malef.Colors.Malef_Palette,
       VGA                => Malef.Colors.VGA,
       Windows_XP_Console => Malef.Colors.Windows_XP_Console,
       Windows_PowerShell => Malef.Colors.Windows_PowerShell,
       Visual_Studio_Code => Malef.Colors.Visual_Studio_Code,
       Windows_10_Console => Malef.Colors.Windows_10_Console,
       Terminal_App       => Malef.Colors.Terminal_App,
       PuTTY              => Malef.Colors.PuTTY,
       mIRC               => Malef.Colors.mIRC,
       xterm              => Malef.Colors.xterm,
       Ubuntu             => Malef.Colors.Ubuntu);


   function To_Ada (Item : Palette_Kind)
                    return Malef.Colors.Palette_Kind is
   begin

      return paletteKindC2Ada(Item);

   end To_Ada;


   function To_C (Item : Malef.Colors.Palette_Kind)
                  return Palette_Kind is
   begin

      return paletteKindAda2C(Item);

   end To_C;



end C_Malef.Colors;

---=======================-------------------------=========================---
--=======================-- E N D   O F   F I L E --=========================--
---=======================-------------------------=========================---
