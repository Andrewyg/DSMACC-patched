SHELL=/bin/bash
export KPP_HOME=$(PWD)/../kpp
all:
	make COCH4.Spec_1.dat.timeseries

%.Spec_1.dat.diurnal: %.dsmacc %.Init_cons.dat.diurnal
	ln -fs $*.Init_cons.dat.diurnal Init_cons.dat && \
	./$* >& $*.diurnal.log && mv Spec_1.dat $*.Spec_1.dat.diurnal && mv Rate_1.dat $*.Rate_1.dat.diurnal

%.Spec_1.dat.timeseries: %.dsmacc %.Init_cons.dat.timeseries
	ln -fs $*.Init_cons.dat.timeseries Init_cons.dat && \
	./$* >& $*.timeseries.log && mv Spec_1.dat $*.Spec_1.dat.timeseries && mv Rate_1.dat $*.Rate_1.dat.timeseries

%.dsmacc: mcm_subset_%.kpp cri.kpp ../src/global.inc ../src/mcmratedef.inc ../src/io.inc ../driver.f90 ../src/tuv.inc ../kpp/bin/kpp ./DATABHH ./DATAE1 ./DATAJ1 ./DATAS1 ./INPUTS
	cd ../src && rm -f depend.mk && ../kpp/bin/kpp ../user/mcm_subset_$*.kpp dsmacc && make && mv ../bin/dsmacc ../user/$*.dsmacc

./DATABHH:
	ln -s ../tuv_new/DATABHH ./
./DATAE1:
	ln -s ../tuv_new/DATAE1 ./
./DATAJ1:
	ln -s ../tuv_new/DATAJ1 ./
./DATAS1:
	ln -s ../tuv_new/DATAS1 ./
./INPUTS:
	ln -s ../tuv_new/INPUTS ./

clean:
	rm -f COCH4.Spec_1.dat.* COCH4.Rate_1.dat.* *.diurnal.log *.timeseries.log COCH4.dsmacc Init_cons.dat
