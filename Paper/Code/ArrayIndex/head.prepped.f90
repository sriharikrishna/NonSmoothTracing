subroutine head(x,y) 
  double precision :: x(2)
  double precision :: y
!$openad INDEPENDENT(x)
  y=0.0
  do i=1,2
    y=y+sin(x(i))+tan(x(i))
  end do
!$openad DEPENDENT(y)
end subroutine
