program driver
  use OAD_active
  use OAD_rev
  use OAD_trace
  implicit none 
  external head
  type(active) :: x(2), y

  x(1)%v=.5D0
  x(2)%v=.75D0
  ! first trace
  call oad_trace_init()
  call oad_trace_open()
  call head(x,y)
  call oad_trace_close()

  x(2)%v=x(2)%v+3.0D0
  ! second trace
  call oad_trace_open()
  call head(x,y)
  call oad_trace_close()

end program driver


