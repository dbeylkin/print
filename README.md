# print
Formatted printing utility in Fortran. This printing utility is convenient for debugging and, with little effort, can be converted into a simple but decent logging facility.

This utility was adapted from prini.f (originally written by V. Rokhlin). For those familiar with prini.f, this utility offers several advantages over its predecessor:

- No need for an initializer call. By default, all print statements are printed to both file and screen (either of which can be disabled, if desired).

- Printing subroutines for all types have a common, single interface: call print("message", var). You do not need to use prin2("message", real) or prinf("message", integer).

- The message string does not need to be terminated by "\*". Previously, the "\*" token was necessary to determine the length of the input message string. This is no longer the case.
