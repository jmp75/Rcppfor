

subroutine myfortsub ( input_string ) bind ( C, name="myfortsub" )

!DEC$ IF DEFINED (_DLL)
!DEC$ ATTRIBUTES DLLEXPORT::myfortsub
!DEC$ END IF

! TODO: credit where I found this from
   use iso_c_binding, only: C_CHAR, c_null_char
   implicit none

   character (kind=c_char, len=1), dimension (10), intent (in) :: input_string
   character (len=10) :: regular_string
   integer :: i

   regular_string = " "
   loop_string: do i=1, 10
      if ( input_string (i) == c_null_char ) then
         exit loop_string
      else
         regular_string (i:i) = input_string (i)
      end if
   end do loop_string

   write (*, *) ">", trim (regular_string), "<", len_trim (regular_string)

   return

end subroutine myfortsub



function myfortfunction () bind ( C, name="myfortfunction" ) result(res)
   character (kind=c_char, len=1), dimension (:) :: res

!DEC$ IF DEFINED (_DLL)
!DEC$ ATTRIBUTES DLLEXPORT::myfortfunction
!DEC$ END IF

! TODO: credit where I found this from
   use iso_c_binding, only: C_CHAR, c_null_char
   implicit none
   
   ! TODO
   res = "Hello from Fortran not_in_screaming_caps"

   return res

end function myfortfunction


