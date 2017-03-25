program print_driver
  use printmod
  implicit none
  integer, parameter :: sp = SELECTED_REAL_KIND(6, 37)
  integer, parameter :: dp = SELECTED_REAL_KIND(15, 307)
  integer, parameter :: qp = SELECTED_REAL_KIND(33, 4931)

  integer :: i, ivect(20)
  real(sp) :: svect(10)
  real(dp) :: dvect(10)
  real(qp) :: qvect(10)
  complex(dp) :: ima, cvect(10)
  logical :: lvect(40)
  character(len=256) :: c

  ! test printing of single precision reals
  call print("pi = ", 4*atan(1.0_sp))
  do i = 1, size(svect)
     svect(i) = i
  end do
  call print("svect = ", svect)

  ! test printing of double precision reals
  call print("pi = ", 4*atan(1.0_dp))
  do i = 1, size(dvect)
     dvect(i) = i
  end do
  call print("dvect = ", dvect)

  ! test printing of quadruple precision reals
  call print("pi = ", 4*atan(1.0_qp))
  do i = 1, size(qvect)
     qvect(i) = i
  end do
  call print("qvect = ", qvect)

  ! test printing of double precision complex numbers
  ima = (0,1)
  call print("ima = ", ima)
  do i = 1, size(cvect)
     cvect(i) = i + ima*sqrt(real(i))
  end do
  call print("cvect = ", cvect)

  ! test printing of integers
  call print("pi = ", int(4*atan(1.0)))
  do i = 1, size(ivect)
     ivect(i) = i
  end do
  call print("ivect = ", ivect)

  ! test printing of logicals
  call print("true = ", .true.)
  call print("false = ", .false.)
  do i = 1, size(lvect)
     if ( mod(i,3) .eq. 0 ) then
        lvect(i) = .true.
     else
        lvect(i) = .false.
     end if
  end do
  call print("lvect = ", lvect)

  ! test printing of characters
  c = "is continued on the next line"
  call print("this message", trim(c))

  ! test turning on/off print to screen/file
  call print(.false., .true.)
  call print("this message only appears in file")
  call print(.true., .false.)
  call print("this message only appears on the screen")
  call print(.false., .false.)
  call print("this message does not appear anywhere")
  call print(.true., .true.)
  call print("this message appears everywhere")

end program print_driver
