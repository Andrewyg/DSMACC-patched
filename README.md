For the original `README.md` from `barronh/DSMACC`, please check [README.orig.md](README.orig.md).

Also, btw, the newest `README` is actually located in `pysrc/` ([portal](pysrc/README.md)).

---

# How to Run

- Run `./install.sh`
    - All arguments are passed to (all) `make` commands (except `make install`

The reason it's recommended to install through the script is because within `pysrc/`, you **MUST** run `make source` before `sudo make install` (which isn't documented in original author's README). If you directly run `sudo make install`, it'll compile fortran codes as admin, which will cause some permission issues.

## Preping Env

- `sudo apt-get install gcc git wget python3 python3-pip bison flex gfortran`
- `pip install numpy matplotlib pandas scipy`
- `sudo pip install numpy` (for `setuptools`)
- `if [ ! -f "/usr/bin/python" ] && [ -f "/usr/bin/python3" ]; then sudo ln -s /usr/bin/python3 /usr/bin/python; fi` (This is considered an overall better fix, as throughout theproject Makefiles uses `python` for `python3`. For the reason not changing Makefiles is...cause some other distro already deprecated `python2` and uses `python` solely for `python3`)

---

# Things We've Changed

1. Patch `rtrans.f`, where originally when compiled will throw out following error
```bash
gfortran -cpp -g -O2 -fno-automatic -fcheck=bounds -fimplicit-none -c rtrans.f
rtrans.f:1342:55:

 1342 |             CALL LEPOLY( NCOS, MAZIM, MXCMU, NSTR - 1, ANGCOS, YLM0 )
      |                                                       1
Error: Rank mismatch in argument ‘mu’ at (1) (rank-1 and scalar)
```
2. Compile `dsmacc_Rates.f90` and `dsmacc_Util.f90` in `src/` without the flag `-fno-automatic`
3. Regenerate Makefiles (with proper flags)
4. Remove old and create new `install.sh` to help you build all dependencies in correct order.

---

# TODO

- [ ] Extract time elapse/interval into parameters within models in `pysrc/`
- [ ] Check time and don't re-run if `*conc.dat` is up-to-date?

---

# Directory Layout
(Unofficial)

- `acp/`
- `cri/`
- `data/`
- `geoschem/`
- `ISOROPIA/`
- `kpp/`: a local kpp (supposedly version `2.2`, though document within it is for `2.1`)
- `pysrc/`: a python plotting wrapper
- `src/`
- `test/`
- `tuv_new/`
- `UCI_fastJX72e/`
- `working/`
