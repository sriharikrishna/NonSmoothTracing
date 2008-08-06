subroutine head(x1,x2,y)
  real,intent(in) :: x1,x2
  real,intent(out) :: y
  integer i
!$openad INDEPENDENT(x1)
!$openad INDEPENDENT(x2)
  y=x1 
  do i=int(x1),int(x2)+2
     y=y*x2 
     if (y>1.0) then 
        y=y*2.0
     end if
  end do
!$openad DEPENDENT(y)
end subroutine head
