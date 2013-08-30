

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


! from http://stackoverflow.com/tags/fortran-iso-c-binding/info
subroutine simulation(alpha, beta, gamma, delta, arrays) bind(c, name="fortsimul")
    use iso_c_binding
    implicit none
    integer (c_long), value                 :: alpha
    real (c_double), intent(inout)          :: beta
    integer (c_long), intent(out)           :: gamma
    real (c_double),dimension(*),intent(in) :: delta
    type, bind(c) :: passed_type
        integer (c_int) :: lenc, lenf
        type (c_ptr)    :: c, f
    end type passed_type
    type (passed_type), intent(inout) :: arrays
    real (c_float), allocatable, target, save :: eta(:)
    real (c_float), pointer :: c_array(:)
    ! ...
    ! associate c_array with an array allocated in c
    call c_f_pointer (arrays%c, c_array, (/arrays%lenc/) )
    ! ...
    ! allocate an array and make it available in c
    arrays%lenf = 100
    allocate (eta(arrays%lenf))
    arrays%f = c_loc(eta)
    ! ...
end subroutine simulation



!!!!  function myfortfunction () bind ( C, name="myfortfunction" ) result(res)
!!!!  ! TODO: credit where I found this from
!!!!     use iso_c_binding, only: C_CHAR, c_null_char
!!!!     implicit none
!!!!  
!!!!     character (kind=c_char, len=1), dimension (100) :: res
!!!!      type(C_PTR) :: res
!!!!      
!!!!      F_C_POINTER
!!!!      C_F_POINTER
!!!!  
!!!!  !DEC$ IF DEFINED (_DLL)
!!!!  !DEC$ ATTRIBUTES DLLEXPORT::myfortfunction
!!!!  !DEC$ END IF
!!!!  
!!!!     
!!!!     ! TODO
!!!!     res = "Hello from Fortran not_in_screaming_caps"
!!!!  
!!!!  end function myfortfunction


