

MEMORY
{
PAGE 0 :
   /* BEGIN is used for the "boot to SARAM" bootloader mode   */

   BEGIN           	: origin = 0x000000, length = 0x000002
   RAMM0           	: origin = 0x000122, length = 0x0002DE
   RAMD0           	: origin = 0x00B000, length = 0x000800
   RAMLS0          	: origin = 0x008000, length = 0x000800
   RAMLS1          	: origin = 0x008800, length = 0x000800
   RAMLS2      		: origin = 0x009000, length = 0x000800
   RAMLS3      		: origin = 0x009800, length = 0x000800
   RAMLS4      		: origin = 0x00A000, length = 0x000800
   RAMLS5          : origin = 0x00A800, length = 0x000800
//   RAMGS0_5          : origin = 0x00C000, length = 0x006000
   RAMGS6_9          : origin = 0x012000, length = 0x004000
   RESET           	: origin = 0x3FFFC0, length = 0x000002

PAGE 1 :

   BOOT_RSVD       : origin = 0x000002, length = 0x000120     /* Part of M0, BOOT rom will use this for stack */
   RAMM1           : origin = 0x000400, length = 0x000400     /* on-chip RAM block M1 */
   RAMD1           : origin = 0x00B800, length = 0x000800


//   RAMGS0          : origin = 0x00C000, length = 0x001000
//   RAMGS1          : origin = 0x00D000, length = 0x001000
//   RAMGS2          : origin = 0x00E000, length = 0x001000
//   RAMGS3          : origin = 0x00F000, length = 0x001000
//   RAMGS4          : origin = 0x010000, length = 0x001000
//   RAMGS5          : origin = 0x011000, length = 0x001000
//   RAMGS6_9          : origin = 0x012000, length = 0x004000
//   RAMGS7          : origin = 0x013000, length = 0x001000
//   RAMGS8          : origin = 0x014000, length = 0x001000
//   RAMGS9          : origin = 0x015000, length = 0x001000
   RAMGS0            : origin = 0x00C000, length = 0x001000
   RAMGS1_3          : origin = 0x00D000, length = 0x003000
   RAMGS4_5          : origin = 0x010000, length = 0x002000
   
   RAMGS10         : origin = 0x016000, length = 0x001000
   RAMGS11         : origin = 0x017000, length = 0x001000
   RAMGS12         : origin = 0x018000, length = 0x001000
   RAMGS13         : origin = 0x019000, length = 0x001000
   RAMGS14         : origin = 0x01A000, length = 0x001000
   RAMGS15         : origin = 0x01B000, length = 0x001000
                   
   EMIF1_CS0n      : origin = 0x80000000, length = 0x10000000
   EMIF1_CS2n      : origin = 0x00100000, length = 0x00200000
   EMIF1_CS3n      : origin = 0x00300000, length = 0x00080000
   EMIF1_CS4n      : origin = 0x00380000, length = 0x00060000
   EMIF2_CS0n      : origin = 0x90000000, length = 0x10000000
   EMIF2_CS2n      : origin = 0x00002000, length = 0x00001000 

   CPU2TOCPU1RAM   : origin = 0x03F800, length = 0x000400
   CPU1TOCPU2RAM   : origin = 0x03FC00, length = 0x000400
}


SECTIONS
{
   codestart        : > BEGIN,      PAGE = 0
#ifdef __TI_COMPILER_VERSION__
  #if __TI_COMPILER_VERSION__ >= 15009000
   .TI.ramfunc 		:  > RAMM0       PAGE = 0
  #else 
   ramfuncs         : > RAMM0       PAGE = 0
  #endif 
#endif  
   .text            : >>  RAMLS0 | RAMLS1 | RAMLS2 | RAMLS3 | RAMLS4 | RAMLS5| RAMGS6_9,   PAGE = 0
   .cinit           : > RAMD0,      PAGE = 0
   .pinit           : > RAMD0,      PAGE = 0
   .switch          : > RAMD0,      PAGE = 0
   .reset           : > RESET,      PAGE = 0, TYPE = DSECT /* not used, */
                                    
   .stack           : > RAMM1,      PAGE = 1
   .ebss            : > RAMGS1_3 ,     PAGE = 1
   .econst          : > RAMGS1_3,     PAGE = 1
   .esysmem         : > RAMGS0,     PAGE = 1
   
   .farbss          : > EMIF1_CS0n, PAGE = 1
   .farconst        : > EMIF1_CS0n, PAGE = 1
   
}

/*
//===========================================================================
// End of file.
//===========================================================================
*/

