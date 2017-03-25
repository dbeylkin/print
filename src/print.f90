!*******************************************************************************
!    Convenient printing utilities.
!    Adapted from prini.f (originally written by V. Rokhlin)
!
!    Copyright (C), 2017 Daniel Beylkin
!
!    This program is free software: you can redistribute it and/or modify
!    it under the terms of the GNU General Public License as published by
!    the Free Software Foundation, either version 3 of the License, or
!    (at your option) any later version.
!
!    This program is distributed in the hope that it will be useful,
!    but WITHOUT ANY WARRANTY; without even the implied warranty of
!    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
!    GNU General Public License for more details.
!
!    You should have received a copy of the GNU General Public License
!    along with this program.  If not, see <http://www.gnu.org/licenses/>.
!*******************************************************************************

module printmod
  implicit none
  integer, parameter :: sp = SELECTED_REAL_KIND(6, 37)
  integer, parameter :: dp = SELECTED_REAL_KIND(15, 307)
  integer, parameter :: qp = SELECTED_REAL_KIND(33, 4931)

  ! flags for printing to screen/printing to file fort.13
  logical :: pscreen1 = .true.
  logical :: pfile1 = .true.

  interface print
     module procedure printspec
     module procedure printfn
     module procedure printf1
     module procedure printn
     module procedure print1
     module procedure print2n
     module procedure print21
     module procedure print2xn
     module procedure print2x1
     module procedure printqn
     module procedure printq1
     module procedure println
     module procedure printl1
     module procedure printa
     module procedure printm
  end interface print

  private
  public print

contains

  ! set/unset print to screen and/or to file
  subroutine printspec(pscreen, pfile)
    logical, optional, intent(in) :: pscreen, pfile

    if ( present(pscreen) ) then
       pscreen1 = pscreen
    end if

    if ( present(pfile) ) then
       pfile1 = pfile
    end if
  end subroutine printspec



  ! subroutine to print an integer
  subroutine printf1(mes, a)
    character(len=*), intent(in) :: mes
    integer, intent(in) :: a
    integer :: nsize

    nsize = len(mes)
    call messpr(mes, nsize)
    if ( pscreen1 ) write(6, 100) a
    if ( pfile1 ) write(13, 100) a
100 format(10(1x,i7))
  end subroutine printf1



  ! subroutine to print an array of integers
  subroutine printfn(mes, a)
    character(len=*), intent(in) :: mes
    integer, intent(in) :: a(:)
    integer :: nsize, n, j

    nsize = len(mes)
    n = size(a)
    call messpr(mes, nsize)
    if ( pscreen1 .and. n /= 0 ) write(6, 100) (a(j), j=1,n)
    if ( pfile1 .and. n /= 0 ) write(13, 100) (a(j), j=1,n)
100 format(10(1x,i7))
  end subroutine printfn



  ! subroutine to print a single-precision real
  subroutine print1(mes, a)
    character(len=*), intent(in) :: mes
    real(sp), intent(in) :: a
    integer :: nsize

    nsize = len(mes)
    call messpr(mes, nsize)
    if ( pscreen1 ) write(6, 100) a
    if ( pfile1 ) write(13, 100) a
100 format(5(2x,e13.6))
  end subroutine print1



  ! subroutine to print an array of single-precision reals
  subroutine printn(mes, a)
    character(len=*), intent(in) :: mes
    real(sp), intent(in) :: a(:)
    integer :: nsize, n, j

    nsize = len(mes)
    n = size(a)
    call messpr(mes, nsize)
    if ( pscreen1 .and. n /= 0 ) write(6, 100) (a(j), j=1,n)
    if ( pfile1 .and. n /= 0 ) write(13, 100) (a(j), j=1,n)
100 format(5(2x,e13.6))
  end subroutine printn



  ! subroutine to print a double-precision real
  subroutine print21(mes, a)
    character(len=*), intent(in) :: mes
    real(dp), intent(in) :: a
    integer :: nsize

    nsize = len(mes)
    call messpr(mes, nsize)
    if ( pscreen1 ) write(6, 100) a
    if ( pfile1 ) write(13, 100) a
100 format(5(2x,e13.6))
  end subroutine print21



  ! subroutine to print an array of double-precision reals
  subroutine print2n(mes, a)
    character(len=*), intent(in) :: mes
    real(dp), intent(in) :: a(:)
    integer :: nsize, n, j

    nsize = len(mes)
    n = size(a)
    call messpr(mes, nsize)
    if ( pscreen1 .and. n /= 0 ) write(6, 100) (a(j), j=1,n)
    if ( pfile1 .and. n /= 0 ) write(13, 100) (a(j), j=1,n)
100 format(5(2x,e13.6))
  end subroutine print2n



  ! subroutine to print a quadruple-precision real
  subroutine print2x1(mes, a)
    character(len=*), intent(in) :: mes
    real(qp), intent(in) :: a
    integer :: nsize

    nsize = len(mes)
    call messpr(mes, nsize)
    if ( pscreen1 ) write(6, 100) a
    if ( pfile1 ) write(13, 100) a
100 format(3(2x,e23.16))
  end subroutine print2x1



  ! subroutine to print an array of quadruple-precision reals
  subroutine print2xn(mes, a)
    character(len=*), intent(in) :: mes
    real(qp), intent(in) :: a(:)
    integer :: nsize, n, j

    nsize = len(mes)
    n = size(a)
    call messpr(mes, nsize)
    if ( pscreen1 .and. n /= 0 ) write(6, 100) (a(j), j=1,n)
    if ( pfile1 .and. n /= 0 ) write(13, 100) (a(j), j=1,n)
100 format(3(2x,e23.16))
  end subroutine print2xn



  ! subroutine to print a double-precision complex number
  subroutine printq1(mes, a)
    character(len=*), intent(in) :: mes
    complex(dp), intent(in) :: a
    integer :: nsize

    nsize = len(mes)
    call messpr(mes, nsize)
    if ( pscreen1 ) write(6, 100) a
    if ( pfile1 ) write(13, 100) a
100 format(5(2x,e13.6))
  end subroutine printq1



  ! subroutine to print an array of double-precision complex numbers
  subroutine printqn(mes, a)
    character(len=*), intent(in) :: mes
    complex(dp), intent(in) :: a(:)
    integer :: nsize, n, j

    nsize = len(mes)
    n = size(a)
    call messpr(mes, nsize)
    if ( pscreen1 .and. n /= 0 ) write(6, 100) (a(j), j=1,n)
    if ( pfile1 .and. n /= 0 ) write(13, 100) (a(j), j=1,n)
100 format(5(2x,e13.6))
  end subroutine printqn



  ! subroutine to print a logical
  subroutine printl1(mes, a)
    character(len=*), intent(in) :: mes
    logical, intent(in) :: a
    integer :: nsize

    nsize = len(mes)
    call messpr(mes, nsize)
    if ( pscreen1 ) write(6, 100) a
    if ( pfile1 ) write(13, 100) a
100 format(20L3)
  end subroutine printl1



  ! subroutine to print an array of logicals
  subroutine println(mes, a)
    character(len=*), intent(in) :: mes
    logical, intent(in) :: a(:)
    integer :: nsize, n, j

    nsize = len(mes)
    n = size(a)
    call messpr(mes, nsize)
    if ( pscreen1 .and. n /= 0 ) write(6, 100) (a(j), j=1,n)
    if ( pfile1 .and. n /= 0 ) write(13, 100) (a(j), j=1,n)
100 format(20L3)
  end subroutine println



  ! subroutine to print a character
  subroutine printa(mes, a)
    character(len=*), intent(in) :: mes
    character(len=*), intent(in) :: a
    integer :: nsize, nasize

    nsize = len(mes)
    nasize = len(a)
    call messpr(mes, nsize)
    call messpr(a, nasize)
  end subroutine printa



  ! subroutine to print a message
  subroutine printm(mes)
    character(len=*), intent(in) :: mes
    integer :: nsize

    nsize = len(mes)
    call messpr(mes, nsize)
  end subroutine printm



  ! common subroutine to print input message
  subroutine messpr(mes, nsize)
    character, intent(in) :: mes(*)
    integer, intent(in) :: nsize
    integer :: j

    if ( pscreen1 .and. nsize /= 0 ) write(6, 100) (mes(j), j=1,nsize)
    if ( pfile1 .and. nsize /= 0 ) write(13, 100) (mes(j), j=1,nsize)
100 format(1x,80a1)
  end subroutine messpr

end module printmod
