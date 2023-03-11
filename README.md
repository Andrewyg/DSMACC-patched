For the original `README.md` from `barronh/DSMACC`, please check [README.orig.md](README.orig.md).

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

## Things still aren't fixed

1. `./configure` errored out at `configure: error: Flex library `libfl` is required by kpp and not found`, while `whereis` returns following output
```bash
$ whereis flex
flex: /usr/bin/flex /usr/share/man/man1/flex.1.gz /usr/share/info/flex.info-1.gz /usr/share/info/flex.info.gz /usr/share/info/flex.info-2.gz
```
