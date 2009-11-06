ifndef (F90C)
F90C=gfortran
endif
RTSUPP=w2f__types OAD_active OAD_rev OAD_trace
run: driver
	./driver
driver: $(addsuffix .o, $(RTSUPP)) driver.o head.prepped.pre.xb.x2w.w2f.post.o
	${F90C} -o $@ $^
head.prepped.pre.xb.x2w.w2f.post.f90 $(addsuffix .f90, $(RTSUPP)) : toolChain
toolChain : head.prepped.f90
	openad -c -m t $<
%.o : %.f90
	${F90C} -o $@ -c $< 
clean: 
	rm -f ad_template* OAD_* w2f__*  iaddr* 
	rm -f head.prepped.pre* *.B *.xaif *.o *.mod oad_tr_* driver *~ 
.PHONY: run clean toolChain
