subroutine foo(t)
  double precision :: t
  call bar(t)
end subroutine

subroutine bar(t)
  double precision :: t
  t=tan(t)
end subroutine

subroutine head(x,y) 
  double precision :: x
  double precision :: y
!$openad INDEPENDENT(x)
  call foo(x)
  call bar(x)
  y=x
!$openad DEPENDENT(y)
end subroutine
