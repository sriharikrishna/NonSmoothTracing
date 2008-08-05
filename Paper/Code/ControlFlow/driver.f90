program driver
  use OAD_active
  use OAD_rev
  use OAD_trace
  implicit none 
  external head
  type(active) :: x1,x2, y

  x1%v=.5D0
  x2%v=.75D0
  ! first trace
  call oad_trace_init()
  call oad_trace_open()
  call head(x1,x2,y)
  call oad_trace_close()

  x2%v=x2%v+1.0D0
  ! second trace
  call oad_trace_open()
  call head(x1,x2,y)
  call oad_trace_close()

end program driver
