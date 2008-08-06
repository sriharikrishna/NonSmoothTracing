subroutine foo(t)
  real :: t
  call bar(t)
end subroutine
subroutine bar(t)
  real :: t
  t=tan(t)
end subroutine
subroutine head(x,y) 
  real :: x
  real :: y
!$openad INDEPENDENT(x)
  call foo(x)
  call bar(x)
  y=x
!$openad DEPENDENT(y)
end subroutine
