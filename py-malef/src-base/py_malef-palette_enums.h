/*****************************************************************************\
 *                                                                           * 
 *              P Y _ M A L E F - P A L E T T E _ E N U M S . H              * 
 *                                                                           * 
 *                                 M A L E F                                 * 
 *                                                                           * 
 *                              C   H E A D E R                              * 
 *                                                                           * 
 *---------------------------------------------------------------------------* 
 *     Copyright (c) 2021 José Antonio Verde Jiménez All Rights Reserved     * 
 *---------------------------------------------------------------------------* 
 * This file is part of Malef.                                               * 
 *                                                                           * 
 * This program is free software:  you  can redistribute it and/or modify it * 
 * under  the terms  of the  GNU  General License  as published by the  Free * 
 * Software  Foundation,  either  version 3  of  the  License,  or  (at your * 
 * opinion) any later version.                                               * 
 *                                                                           * 
 * This  program  is distributed  in the  hope that  it will be  useful, but * 
 * WITHOUT   ANY   WARRANTY;   without   even  the   implied   warranty   of * 
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General * 
 * Public License for more details.                                          * 
 *                                                                           * 
 * You should have received  a copy of the  GNU General Public License along * 
 * with this program. If not, see <https://www.gnu.org/licenses/>.           * 
 *                                                                           * 
\*****************************************************************************/

#ifndef MALEF_PALETTE_ENUMS_H
#define MALEF_PALETTE_ENUMS_H

#include <stddef.h>
#include "structmember.h"

/*
 * This struct contains all the Palette kinds.
 */
typedef struct {
   PyObject_HEAD
   int MALEF_PALETTE,
       VGA,
       WINDOWS_XP_CONSOLE,
       WINDOWS_POWERSHELL,
       VISUAL_STUDIO_CODE,
       WINDOWS_10_CONSOLE,
       TERMINAL_APP,
       PUTTY,
       MIRC,
       XTERM,
       UBUNTU;
} _pyMalef_paletteEnumStruct ;



/*###########################################################################*\
 *##################### P R I V A T E   M E T H O D S #######################*
\*###########################################################################*/

/*
 * *** malef.PaletteEnum.__new__ ***
 *
 * This function allocates the ColorEnum class and initialises its values.
 */
static PyObject*
pyMalef_PaletteEnum___new__ ( PyTypeObject *type,
                              PyObject     *args,
                              PyObject     *kwargs ) {
   // We create a new object and allocate it.
   _pyMalef_paletteEnumStruct *self ;
   self = (_pyMalef_paletteEnumStruct*)type->tp_alloc( type, 0 ) ;
   if ( self != NULL ) {
      self->MALEF_PALETTE      = malef_MALEF_PALETTE ;
      self->VGA                = malef_VGA ;
      self->WINDOWS_XP_CONSOLE = malef_WINDOWS_XP_CONSOLE ;
      self->WINDOWS_POWERSHELL = malef_WINDOWS_POWERSHELL ;
      self->VISUAL_STUDIO_CODE = malef_VISUAL_STUDIO_CODE ;
      self->WINDOWS_10_CONSOLE = malef_WINDOWS_10_CONSOLE ;
      self->TERMINAL_APP       = malef_TERMINAL_APP       ;
      self->PUTTY              = malef_PUTTY              ;
      self->MIRC               = malef_MIRC               ;
      self->XTERM              = malef_XTERM              ;
      self->UBUNTU             = malef_UBUNTU             ;
   }

   return (PyObject*)self ;
}


/*###########################################################################*\
 *################# P Y T H O N   P A L E T T E _ E N U M  ##################*
\*###########################################################################*/

#define _PYMALEF_PALETTE_ENUM_DEFINE_PALETTE_MEMBER(name) \
   {#name, T_INT, offsetof (_pyMalef_paletteEnumStruct, name), READONLY, #name}

static PyMemberDef
pyMalef_PaletteEnum_members[] = {
   _PYMALEF_PALETTE_ENUM_DEFINE_PALETTE_MEMBER(MALEF_PALETTE),
   _PYMALEF_PALETTE_ENUM_DEFINE_PALETTE_MEMBER(VGA),
   _PYMALEF_PALETTE_ENUM_DEFINE_PALETTE_MEMBER(WINDOWS_XP_CONSOLE),
   _PYMALEF_PALETTE_ENUM_DEFINE_PALETTE_MEMBER(WINDOWS_POWERSHELL),
   _PYMALEF_PALETTE_ENUM_DEFINE_PALETTE_MEMBER(VISUAL_STUDIO_CODE),
   _PYMALEF_PALETTE_ENUM_DEFINE_PALETTE_MEMBER(WINDOWS_10_CONSOLE),
   _PYMALEF_PALETTE_ENUM_DEFINE_PALETTE_MEMBER(TERMINAL_APP),
   _PYMALEF_PALETTE_ENUM_DEFINE_PALETTE_MEMBER(PUTTY),
   _PYMALEF_PALETTE_ENUM_DEFINE_PALETTE_MEMBER(MIRC),
   _PYMALEF_PALETTE_ENUM_DEFINE_PALETTE_MEMBER(XTERM),
   _PYMALEF_PALETTE_ENUM_DEFINE_PALETTE_MEMBER(UBUNTU),
   {NULL}      /* SENTINEL */
} ;

static PyTypeObject
pyMalef_PaletteEnum = {
   PyVarObject_HEAD_INIT ( NULL, 0 )
   .tp_name      = "malef.PaletteEnum",
   .tp_doc       = "TODO: Add documentation",
   .tp_basicsize = sizeof(_pyMalef_paletteEnumStruct),
   .tp_new       = pyMalef_PaletteEnum___new__,
   .tp_members   = pyMalef_PaletteEnum_members
} ;



/*###########################################################################*\
 *################# P A L E T T E _ E N U M   F / I N I T  ##################*
\*###########################################################################*/

/*
 * This function finalises and clears the PaletteEnum declared in this header.
 *
 * @param module
 * The modile where it has been previously added.
 */
static void
_pyMalef_finalizePaletteEnums ( PyObject *module ) {

   Py_DECREF ( &pyMalef_PaletteEnum ) ;
}

/*
 * This function adds the PaletteEnum type into the Python module.
 *
 * @param module
 * Well, we need the module as a paramater to add it somewhere.
 *
 * @return
 * Successful? or Not?
 */
static bool
_pyMalef_initializePaletteEnums ( PyObject *module ) {

   if ( PyType_Ready ( &pyMalef_PaletteEnum ) < 0 ) {
      return false ;
   }

   Py_INCREF ( &pyMalef_PaletteEnum ) ;
   if ( PyModule_AddObject ( module, "PaletteEnum",
                             (PyObject*)&(pyMalef_PaletteEnum) ) < 0 ) {
      Py_DECREF ( &pyMalef_PaletteEnum ) ;
      return false ;
   }

   return true ;
}

#endif//MALEF_PALETTE_ENUMS_H

///=======================/////////////////////////=========================///
//=======================// E N D   O F   F I L E //=========================//
///=======================/////////////////////////=========================///