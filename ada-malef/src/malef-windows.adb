-------------------------------------------------------------------------------
--                                                                           --
--                     M A L E F - W I N D O W S . A D B                     --
--                                                                           --
--                                 M A L E F                                 --
--                                                                           --
--                                  B O D Y                                  --
--                                                                           --
-------------------------------------------------------------------------------
--     Copyright (c) 2020 José Antonio Verde Jiménez All Rights Reserved     --
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

with Malef.Exceptions;

package body Malef.Windows is

   procedure Prepare_Terminal is
   -- procedure C_Driver_Set_Up_Console;
   -- pragma Import (C, C_Driver_Set_Up_Console, "setupConsole");
   -- 
   -- procedure C_Driver_Set_Console_Title (Title : Interfaces.C.Char_Array);
   begin
      null; -- TODO
   exception
      when others =>
         raise Malef.Exceptions.Initialization_Error;
   end Prepare_Terminal;


   procedure Restore_Terminal is
   begin
      null; -- TODO
   exception
      when others =>
         raise Malef.Exceptions.Initialization_Error;
   end Restore_Terminal;

end Malef.Windows;

---=======================-------------------------=========================---
--=======================-- E N D   O F   F I L E --=========================--
---=======================-------------------------=========================---
