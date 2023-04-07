SHELL=/bin/bash
export KPP_HOME=$(PWD)/../kpp
all:
	make UserModel.Spec_1.dat.timeseries

%.Spec_1.dat.diurnal: UserModel %.Init_cons.dat.diurnal
	ln -fs $*.Init_cons.dat.diurnal Init_cons.dat && \
	./UserModel >& $*.diurnal.log && mv Spec_1.dat $*.Spec_1.dat.diurnal && mv Rate_1.dat $*.Rate_1.dat.diurnal

%.Spec_1.dat.timeseries: UserModel %.Init_cons.dat.timeseries
	ln -fs $*.Init_cons.dat.timeseries Init_cons.dat && \
	./UserModel >& $*.timeseries.log && mv Spec_1.dat $*.Spec_1.dat.timeseries && mv Rate_1.dat $*.Rate_1.dat.timeseries

UserModel: user_mcm_subset.kpp cri.kpp ../src/global.inc ../src/mcmratedef.inc ../src/io.inc ../driver.f90 ../src/tuv.inc ../kpp/bin/kpp ./DATABHH ./DATAE1 ./DATAJ1 ./DATAS1 ./INPUTS
	cd ../src && rm -f depend.mk && ../kpp/bin/kpp ../user/model.kpp dsmacc && make && mv ../bin/dsmacc ../user/UserModel

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

../kpp/bin/kpp:
	cd .. && ./install.sh

clean:
	rm -f *.Spec_1.dat.* *.Rate_1.dat.* *.diurnal.log *.timeseries.log UserModel Init_cons.dat user_mcm_subset.kpp
	rm -rf ./DATABHH ./DATAE1 ./DATAJ1 ./DATAS1 ./INPUTS
