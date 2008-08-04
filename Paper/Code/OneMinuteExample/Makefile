ifndef (F90C)
F90C=gfortran
endif

driver: w2f__types.o OAD_active.o OAD_rev.o OAD_trace.o driver.o head.prepped.xb.x2w.w2f.pp.o
	${F90C} -o $@ $^

head.prepped.xb.x2w.w2f.pp.f : head.prepped.f90
	openad -m t $<

%.o : %.f90
	${F90C} -o $@ -c $< 

%.o : %.f
	${F90C} -o $@ -c $< 

clean: 
	rm -rf head.prepped.x* openad* ad_template* OAD_* w2f__*  iaddr* *.mod oad_tr_* driver *~ *.o *.B
