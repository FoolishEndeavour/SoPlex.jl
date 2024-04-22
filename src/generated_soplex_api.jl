# no prototype is found for this function at soplex_interface.h:18:7, please use with caution
"""
    SoPlex_create()

### Prototype
```c
void* SoPlex_create();
```
"""
function SoPlex_create()
    ccall((:SoPlex_create, libsoplex_library), Ptr{Cvoid}, ())
end

"""
    SoPlex_free(soplex)

### Prototype
```c
void SoPlex_free(void* soplex);
```
"""
function SoPlex_free(soplex)
    ccall((:SoPlex_free, libsoplex_library), Cvoid, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_readInstanceFile(soplex, filename)

### Prototype
```c
bool SoPlex_readInstanceFile(void* soplex, const char* filename);
```
"""
function SoPlex_readInstanceFile(soplex, filename)
    ccall((:SoPlex_readInstanceFile, libsoplex_library), Bool, (Ptr{Cvoid}, Cstring), soplex, filename)
end

"""
    SoPlex_readBasisFile(soplex, filename)

### Prototype
```c
bool SoPlex_readBasisFile(void* soplex, const char* filename);
```
"""
function SoPlex_readBasisFile(soplex, filename)
    ccall((:SoPlex_readBasisFile, libsoplex_library), Bool, (Ptr{Cvoid}, Cstring), soplex, filename)
end

"""
    SoPlex_readSettingsFile(soplex, filename)

### Prototype
```c
bool SoPlex_readSettingsFile(void* soplex, const char* filename);
```
"""
function SoPlex_readSettingsFile(soplex, filename)
    ccall((:SoPlex_readSettingsFile, libsoplex_library), Bool, (Ptr{Cvoid}, Cstring), soplex, filename)
end

"""
    SoPlex_writeInstanceFileReal(soplex, filename)

### Prototype
```c
bool SoPlex_writeInstanceFileReal(void* soplex, const char* filename);
```
"""
function SoPlex_writeInstanceFileReal(soplex, filename)
    ccall((:SoPlex_writeInstanceFileReal, libsoplex_library), Bool, (Ptr{Cvoid}, Cstring), soplex, filename)
end

"""
    SoPlex_writeDualFileReal(soplex, filename)

### Prototype
```c
bool SoPlex_writeDualFileReal(void* soplex, const char* filename);
```
"""
function SoPlex_writeDualFileReal(soplex, filename)
    ccall((:SoPlex_writeDualFileReal, libsoplex_library), Bool, (Ptr{Cvoid}, Cstring), soplex, filename)
end

"""
    SoPlex_writeBasisFile(soplex, filename)

### Prototype
```c
bool SoPlex_writeBasisFile(void* soplex, const char* filename);
```
"""
function SoPlex_writeBasisFile(soplex, filename)
    ccall((:SoPlex_writeBasisFile, libsoplex_library), Bool, (Ptr{Cvoid}, Cstring), soplex, filename)
end

"""
    SoPlex_writeStateFileReal(soplex, filename)

### Prototype
```c
void SoPlex_writeStateFileReal(void* soplex, const char* filename);
```
"""
function SoPlex_writeStateFileReal(soplex, filename)
    ccall((:SoPlex_writeStateFileReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cstring), soplex, filename)
end

"""
    SoPlex_writeStateFileRational(soplex, filename)

### Prototype
```c
void SoPlex_writeStateFileRational(void* soplex, const char* filename);
```
"""
function SoPlex_writeStateFileRational(soplex, filename)
    ccall((:SoPlex_writeStateFileRational, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cstring), soplex, filename)
end

"""
    SoPlex_clearLPReal(soplex)

### Prototype
```c
void SoPlex_clearLPReal(void* soplex);
```
"""
function SoPlex_clearLPReal(soplex)
    ccall((:SoPlex_clearLPReal, libsoplex_library), Cvoid, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_numRows(soplex)

### Prototype
```c
int SoPlex_numRows(void* soplex);
```
"""
function SoPlex_numRows(soplex)
    ccall((:SoPlex_numRows, libsoplex_library), Cint, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_numCols(soplex)

### Prototype
```c
int SoPlex_numCols(void* soplex);
```
"""
function SoPlex_numCols(soplex)
    ccall((:SoPlex_numCols, libsoplex_library), Cint, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_setRational(soplex)

### Prototype
```c
void SoPlex_setRational(void* soplex);
```
"""
function SoPlex_setRational(soplex)
    ccall((:SoPlex_setRational, libsoplex_library), Cvoid, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_setBoolParam(soplex, paramcode::Cint, paramvalue::Bool)

### Prototype
```c
bool SoPlex_setBoolParam(void* soplex, SoPlex_BoolParamEnum paramcode, bool paramvalue);
```
"""
function SoPlex_setBoolParam(soplex, paramcode::Cint, paramvalue::Bool)
    ccall((:SoPlex_setBoolParam, libsoplex_library), Bool, (Ptr{Cvoid}, Cint, Bool), soplex, paramcode, paramvalue)
end

"""
    SoPlex_setIntParam(soplex, paramcode::Cint, paramvalue::Cint)

### Prototype
```c
bool SoPlex_setIntParam(void* soplex, SoPlex_IntParamEnum paramcode, int paramvalue);
```
"""
function SoPlex_setIntParam(soplex, paramcode::Cint, paramvalue::Cint)
    ccall((:SoPlex_setIntParam, libsoplex_library), Bool, (Ptr{Cvoid}, Cint, Cint), soplex, paramcode, paramvalue)
end

"""
    SoPlex_setRealParam(soplex, paramcode::Cint, paramvalue::Cdouble)

### Prototype
```c
bool SoPlex_setRealParam(void* soplex, SoPlex_RealParamEnum paramcode, double paramvalue);
```
"""
function SoPlex_setRealParam(soplex, paramcode::Cint, paramvalue::Cdouble)
    ccall((:SoPlex_setRealParam, libsoplex_library), Bool, (Ptr{Cvoid}, Cint, Cdouble), soplex, paramcode, paramvalue)
end

"""
    SoPlex_getBoolParam(soplex, paramcode::Cint)

### Prototype
```c
bool SoPlex_getBoolParam(void* soplex, SoPlex_BoolParamEnum paramcode);
```
"""
function SoPlex_getBoolParam(soplex, paramcode::Cint)
    ccall((:SoPlex_getBoolParam, libsoplex_library), Bool, (Ptr{Cvoid}, Cint), soplex, paramcode)
end

"""
    SoPlex_getIntParam(soplex, paramcode::Cint)

### Prototype
```c
int SoPlex_getIntParam(void* soplex, SoPlex_IntParamEnum paramcode);
```
"""
function SoPlex_getIntParam(soplex, paramcode::Cint)
    ccall((:SoPlex_getIntParam, libsoplex_library), Cint, (Ptr{Cvoid}, Cint), soplex, paramcode)
end

"""
    SoPlex_getRealParam(soplex, paramcode::Cint)

### Prototype
```c
double SoPlex_getRealParam(void* soplex, SoPlex_RealParamEnum paramcode);
```
"""
function SoPlex_getRealParam(soplex, paramcode::Cint)
    ccall((:SoPlex_getRealParam, libsoplex_library), Cdouble, (Ptr{Cvoid}, Cint), soplex, paramcode)
end

"""
    SoPlex_addColReal(soplex, colentries, colsize::Cint, nnonzeros::Cint, objval::Cdouble, lb::Cdouble, ub::Cdouble)

### Prototype
```c
void SoPlex_addColReal(void* soplex, double* colentries, int colsize, int nnonzeros, double objval, double lb, double ub);
```
"""
function SoPlex_addColReal(soplex, colentries, colsize::Cint, nnonzeros::Cint, objval::Cdouble, lb::Cdouble, ub::Cdouble)
    ccall((:SoPlex_addColReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Cint, Cint, Cdouble, Cdouble, Cdouble), soplex, colentries, colsize, nnonzeros, objval, lb, ub)
end

"""
    SoPlex_removeColReal(soplex, colidx::Cint)

### Prototype
```c
void SoPlex_removeColReal(void* soplex, int colidx);
```
"""
function SoPlex_removeColReal(soplex, colidx::Cint)
    ccall((:SoPlex_removeColReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint), soplex, colidx)
end

"""
    SoPlex_addColRational(soplex, colnums, coldenoms, colsize::Cint, nnonzeros::Cint, objvalnum::SoPlex_RatIntType, objvaldenom::SoPlex_RatIntType, lbnum::SoPlex_RatIntType, lbdenom::SoPlex_RatIntType, ubnum::SoPlex_RatIntType, ubdenom::SoPlex_RatIntType)

### Prototype
```c
void SoPlex_addColRational(void* soplex, SoPlex_RatIntType* colnums, SoPlex_RatIntType* coldenoms, int colsize, int nnonzeros, SoPlex_RatIntType objvalnum, SoPlex_RatIntType objvaldenom, SoPlex_RatIntType lbnum, SoPlex_RatIntType lbdenom, SoPlex_RatIntType ubnum, SoPlex_RatIntType ubdenom);
```
"""
function SoPlex_addColRational(soplex, colnums, coldenoms, colsize::Cint, nnonzeros::Cint, objvalnum::SoPlex_RatIntType, objvaldenom::SoPlex_RatIntType, lbnum::SoPlex_RatIntType, lbdenom::SoPlex_RatIntType, ubnum::SoPlex_RatIntType, ubdenom::SoPlex_RatIntType)
    ccall((:SoPlex_addColRational, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{SoPlex_RatIntType}, Ptr{SoPlex_RatIntType}, Cint, Cint, SoPlex_RatIntType, SoPlex_RatIntType, SoPlex_RatIntType, SoPlex_RatIntType, SoPlex_RatIntType, SoPlex_RatIntType), soplex, colnums, coldenoms, colsize, nnonzeros, objvalnum, objvaldenom, lbnum, lbdenom, ubnum, ubdenom)
end

"""
    SoPlex_removeColRational(soplex, colidx::Cint)

### Prototype
```c
void SoPlex_removeColRational(void* soplex, int colidx);
```
"""
function SoPlex_removeColRational(soplex, colidx::Cint)
    ccall((:SoPlex_removeColRational, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint), soplex, colidx)
end

"""
    SoPlex_addRowReal(soplex, rowentries, rowsize::Cint, nnonzeros::Cint, lb::Cdouble, ub::Cdouble)

### Prototype
```c
void SoPlex_addRowReal(void* soplex, double* rowentries, int rowsize, int nnonzeros, double lb, double ub);
```
"""
function SoPlex_addRowReal(soplex, rowentries, rowsize::Cint, nnonzeros::Cint, lb::Cdouble, ub::Cdouble)
    ccall((:SoPlex_addRowReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Cint, Cint, Cdouble, Cdouble), soplex, rowentries, rowsize, nnonzeros, lb, ub)
end

"""
    SoPlex_removeRowReal(soplex, rowidx::Cint)

### Prototype
```c
void SoPlex_removeRowReal(void* soplex, int rowidx);
```
"""
function SoPlex_removeRowReal(soplex, rowidx::Cint)
    ccall((:SoPlex_removeRowReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint), soplex, rowidx)
end

"""
    SoPlex_addRowRational(soplex, rownums, rowdenoms, rowsize::Cint, nnonzeros::Cint, lbnum::SoPlex_RatIntType, lbdenom::SoPlex_RatIntType, ubnum::SoPlex_RatIntType, ubdenom::SoPlex_RatIntType)

### Prototype
```c
void SoPlex_addRowRational(void* soplex, SoPlex_RatIntType* rownums, SoPlex_RatIntType* rowdenoms, int rowsize, int nnonzeros, SoPlex_RatIntType lbnum, SoPlex_RatIntType lbdenom, SoPlex_RatIntType ubnum, SoPlex_RatIntType ubdenom);
```
"""
function SoPlex_addRowRational(soplex, rownums, rowdenoms, rowsize::Cint, nnonzeros::Cint, lbnum::SoPlex_RatIntType, lbdenom::SoPlex_RatIntType, ubnum::SoPlex_RatIntType, ubdenom::SoPlex_RatIntType)
    ccall((:SoPlex_addRowRational, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{SoPlex_RatIntType}, Ptr{SoPlex_RatIntType}, Cint, Cint, SoPlex_RatIntType, SoPlex_RatIntType, SoPlex_RatIntType, SoPlex_RatIntType), soplex, rownums, rowdenoms, rowsize, nnonzeros, lbnum, lbdenom, ubnum, ubdenom)
end

"""
    SoPlex_removeRowRational(soplex, rowidx::Cint)

### Prototype
```c
void SoPlex_removeRowRational(void* soplex, int rowidx);
```
"""
function SoPlex_removeRowRational(soplex, rowidx::Cint)
    ccall((:SoPlex_removeRowRational, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint), soplex, rowidx)
end

"""
    SoPlex_getPrimalReal(soplex, primal, dim::Cint)

### Prototype
```c
void SoPlex_getPrimalReal(void* soplex, double* primal, int dim);
```
"""
function SoPlex_getPrimalReal(soplex, primal, dim::Cint)
    ccall((:SoPlex_getPrimalReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Cint), soplex, primal, dim)
end

"""
    SoPlex_getPrimalRationalString(soplex, dim::Cint)

### Prototype
```c
char* SoPlex_getPrimalRationalString(void* soplex, int dim);
```
"""
function SoPlex_getPrimalRationalString(soplex, dim::Cint)
    ccall((:SoPlex_getPrimalRationalString, libsoplex_library), Cstring, (Ptr{Cvoid}, Cint), soplex, dim)
end

"""
    SoPlex_getDualReal(soplex, dual, dim::Cint)

### Prototype
```c
void SoPlex_getDualReal(void* soplex, double* dual, int dim);
```
"""
function SoPlex_getDualReal(soplex, dual, dim::Cint)
    ccall((:SoPlex_getDualReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Cint), soplex, dual, dim)
end

"""
    SoPlex_getRedCostReal(soplex, rc, dim::Cint)

### Prototype
```c
void SoPlex_getRedCostReal(void* soplex, double* rc, int dim);
```
"""
function SoPlex_getRedCostReal(soplex, rc, dim::Cint)
    ccall((:SoPlex_getRedCostReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Cint), soplex, rc, dim)
end

"""
    SoPlex_optimize(soplex)

### Prototype
```c
int SoPlex_optimize(void* soplex);
```
"""
function SoPlex_optimize(soplex)
    ccall((:SoPlex_optimize, libsoplex_library), Cint, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_getStatus(soplex)

### Prototype
```c
int SoPlex_getStatus(void* soplex);
```
"""
function SoPlex_getStatus(soplex)
    ccall((:SoPlex_getStatus, libsoplex_library), Cint, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_getSolvingTime(soplex)

### Prototype
```c
double SoPlex_getSolvingTime(void* soplex);
```
"""
function SoPlex_getSolvingTime(soplex)
    ccall((:SoPlex_getSolvingTime, libsoplex_library), Cdouble, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_getNumIterations(soplex)

### Prototype
```c
int SoPlex_getNumIterations(void* soplex);
```
"""
function SoPlex_getNumIterations(soplex)
    ccall((:SoPlex_getNumIterations, libsoplex_library), Cint, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_changeObjReal(soplex, obj, dim::Cint)

### Prototype
```c
void SoPlex_changeObjReal(void* soplex, double* obj, int dim);
```
"""
function SoPlex_changeObjReal(soplex, obj, dim::Cint)
    ccall((:SoPlex_changeObjReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Cint), soplex, obj, dim)
end

"""
    SoPlex_changeObjRational(soplex, objnums, objdenoms, dim::Cint)

### Prototype
```c
void SoPlex_changeObjRational(void* soplex, SoPlex_RatIntType* objnums, SoPlex_RatIntType* objdenoms, int dim);
```
"""
function SoPlex_changeObjRational(soplex, objnums, objdenoms, dim::Cint)
    ccall((:SoPlex_changeObjRational, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{SoPlex_RatIntType}, Ptr{SoPlex_RatIntType}, Cint), soplex, objnums, objdenoms, dim)
end

"""
    SoPlex_changeLhsReal(soplex, lhs, dim::Cint)

### Prototype
```c
void SoPlex_changeLhsReal(void* soplex, double* lhs, int dim);
```
"""
function SoPlex_changeLhsReal(soplex, lhs, dim::Cint)
    ccall((:SoPlex_changeLhsReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Cint), soplex, lhs, dim)
end

"""
    SoPlex_changeRowLhsReal(soplex, rowidx::Cint, lhs::Cdouble)

### Prototype
```c
void SoPlex_changeRowLhsReal(void* soplex, int rowidx, double lhs);
```
"""
function SoPlex_changeRowLhsReal(soplex, rowidx::Cint, lhs::Cdouble)
    ccall((:SoPlex_changeRowLhsReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint, Cdouble), soplex, rowidx, lhs)
end

"""
    SoPlex_changeLhsRational(soplex, lhsnums, lhsdenoms, dim::Cint)

### Prototype
```c
void SoPlex_changeLhsRational(void* soplex, SoPlex_RatIntType* lhsnums, SoPlex_RatIntType* lhsdenoms, int dim);
```
"""
function SoPlex_changeLhsRational(soplex, lhsnums, lhsdenoms, dim::Cint)
    ccall((:SoPlex_changeLhsRational, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{SoPlex_RatIntType}, Ptr{SoPlex_RatIntType}, Cint), soplex, lhsnums, lhsdenoms, dim)
end

"""
    SoPlex_changeRhsReal(soplex, rhs, dim::Cint)

### Prototype
```c
void SoPlex_changeRhsReal(void* soplex, double* rhs, int dim);
```
"""
function SoPlex_changeRhsReal(soplex, rhs, dim::Cint)
    ccall((:SoPlex_changeRhsReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Cint), soplex, rhs, dim)
end

"""
    SoPlex_changeRowRhsReal(soplex, rowidx::Cint, rhs::Cdouble)

### Prototype
```c
void SoPlex_changeRowRhsReal(void* soplex, int rowidx, double rhs);
```
"""
function SoPlex_changeRowRhsReal(soplex, rowidx::Cint, rhs::Cdouble)
    ccall((:SoPlex_changeRowRhsReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint, Cdouble), soplex, rowidx, rhs)
end

"""
    SoPlex_changeRhsRational(soplex, rhsnums, rhsdenoms, dim::Cint)

### Prototype
```c
void SoPlex_changeRhsRational(void* soplex, SoPlex_RatIntType* rhsnums, SoPlex_RatIntType* rhsdenoms, int dim);
```
"""
function SoPlex_changeRhsRational(soplex, rhsnums, rhsdenoms, dim::Cint)
    ccall((:SoPlex_changeRhsRational, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{SoPlex_RatIntType}, Ptr{SoPlex_RatIntType}, Cint), soplex, rhsnums, rhsdenoms, dim)
end

"""
    SoPlex_changeRangeReal(soplex, lhs, rhs, dim::Cint)

### Prototype
```c
void SoPlex_changeRangeReal(void* soplex, double* lhs, double* rhs, int dim);
```
"""
function SoPlex_changeRangeReal(soplex, lhs, rhs, dim::Cint)
    ccall((:SoPlex_changeRangeReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Ptr{Cdouble}, Cint), soplex, lhs, rhs, dim)
end

"""
    SoPlex_changeRowRangeReal(soplex, rowidx::Cint, lhs::Cdouble, rhs::Cdouble)

### Prototype
```c
void SoPlex_changeRowRangeReal(void* soplex, int rowidx, double lhs, double rhs);
```
"""
function SoPlex_changeRowRangeReal(soplex, rowidx::Cint, lhs::Cdouble, rhs::Cdouble)
    ccall((:SoPlex_changeRowRangeReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint, Cdouble, Cdouble), soplex, rowidx, lhs, rhs)
end

"""
    SoPlex_objValueReal(soplex)

### Prototype
```c
double SoPlex_objValueReal(void* soplex);
```
"""
function SoPlex_objValueReal(soplex)
    ccall((:SoPlex_objValueReal, libsoplex_library), Cdouble, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_objValueRationalString(soplex)

### Prototype
```c
char* SoPlex_objValueRationalString(void* soplex);
```
"""
function SoPlex_objValueRationalString(soplex)
    ccall((:SoPlex_objValueRationalString, libsoplex_library), Cstring, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_changeBoundsReal(soplex, lb, ub, dim::Cint)

### Prototype
```c
void SoPlex_changeBoundsReal(void* soplex, double* lb, double* ub, int dim);
```
"""
function SoPlex_changeBoundsReal(soplex, lb, ub, dim::Cint)
    ccall((:SoPlex_changeBoundsReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Ptr{Cdouble}, Cint), soplex, lb, ub, dim)
end

"""
    SoPlex_changeVarBoundsReal(soplex, colidx::Cint, lb::Cdouble, ub::Cdouble)

### Prototype
```c
void SoPlex_changeVarBoundsReal(void* soplex, int colidx, double lb, double ub);
```
"""
function SoPlex_changeVarBoundsReal(soplex, colidx::Cint, lb::Cdouble, ub::Cdouble)
    ccall((:SoPlex_changeVarBoundsReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint, Cdouble, Cdouble), soplex, colidx, lb, ub)
end

"""
    SoPlex_changeVarBoundsRational(soplex, colidx::Cint, lbnum::SoPlex_RatIntType, lbdenom::SoPlex_RatIntType, ubnum::SoPlex_RatIntType, ubdenom::SoPlex_RatIntType)

### Prototype
```c
void SoPlex_changeVarBoundsRational(void* soplex, int colidx, SoPlex_RatIntType lbnum, SoPlex_RatIntType lbdenom, SoPlex_RatIntType ubnum, SoPlex_RatIntType ubdenom);
```
"""
function SoPlex_changeVarBoundsRational(soplex, colidx::Cint, lbnum::SoPlex_RatIntType, lbdenom::SoPlex_RatIntType, ubnum::SoPlex_RatIntType, ubdenom::SoPlex_RatIntType)
    ccall((:SoPlex_changeVarBoundsRational, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint, SoPlex_RatIntType, SoPlex_RatIntType, SoPlex_RatIntType, SoPlex_RatIntType), soplex, colidx, lbnum, lbdenom, ubnum, ubdenom)
end

"""
    SoPlex_changeLowerReal(soplex, lb, dim::Cint)

### Prototype
```c
void SoPlex_changeLowerReal(void* soplex, double* lb, int dim);
```
"""
function SoPlex_changeLowerReal(soplex, lb, dim::Cint)
    ccall((:SoPlex_changeLowerReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Cint), soplex, lb, dim)
end

"""
    SoPlex_changeVarLowerReal(soplex, colidx::Cint, lb::Cdouble)

### Prototype
```c
void SoPlex_changeVarLowerReal(void* soplex, int colidx, double lb);
```
"""
function SoPlex_changeVarLowerReal(soplex, colidx::Cint, lb::Cdouble)
    ccall((:SoPlex_changeVarLowerReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint, Cdouble), soplex, colidx, lb)
end

"""
    SoPlex_getLowerReal(soplex, lb, dim::Cint)

### Prototype
```c
void SoPlex_getLowerReal(void* soplex, double* lb, int dim);
```
"""
function SoPlex_getLowerReal(soplex, lb, dim::Cint)
    ccall((:SoPlex_getLowerReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Cint), soplex, lb, dim)
end

"""
    SoPlex_getObjReal(soplex, obj, dim::Cint)

### Prototype
```c
void SoPlex_getObjReal(void* soplex, double* obj, int dim);
```
"""
function SoPlex_getObjReal(soplex, obj, dim::Cint)
    ccall((:SoPlex_getObjReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Cint), soplex, obj, dim)
end

"""
    SoPlex_changeUpperReal(soplex, ub, dim::Cint)

### Prototype
```c
void SoPlex_changeUpperReal(void* soplex, double* ub, int dim);
```
"""
function SoPlex_changeUpperReal(soplex, ub, dim::Cint)
    ccall((:SoPlex_changeUpperReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Cint), soplex, ub, dim)
end

"""
    SoPlex_changeVarUpperReal(soplex, colidx::Cint, ub::Cdouble)

### Prototype
```c
void SoPlex_changeVarUpperReal(void* soplex, int colidx, double ub);
```
"""
function SoPlex_changeVarUpperReal(soplex, colidx::Cint, ub::Cdouble)
    ccall((:SoPlex_changeVarUpperReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint, Cdouble), soplex, colidx, ub)
end

"""
    SoPlex_getUpperReal(soplex, ub, dim::Cint)

### Prototype
```c
void SoPlex_getUpperReal(void* soplex, double* ub, int dim);
```
"""
function SoPlex_getUpperReal(soplex, ub, dim::Cint)
    ccall((:SoPlex_getUpperReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Ptr{Cdouble}, Cint), soplex, ub, dim)
end

"""
    SoPlex_isPrimalFeasible(soplex)

### Prototype
```c
bool SoPlex_isPrimalFeasible(void* soplex);
```
"""
function SoPlex_isPrimalFeasible(soplex)
    ccall((:SoPlex_isPrimalFeasible, libsoplex_library), Bool, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_hasSol(soplex)

### Prototype
```c
bool SoPlex_hasSol(void* soplex);
```
"""
function SoPlex_hasSol(soplex)
    ccall((:SoPlex_hasSol, libsoplex_library), Bool, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_hasPrimalRay(soplex)

### Prototype
```c
bool SoPlex_hasPrimalRay(void* soplex);
```
"""
function SoPlex_hasPrimalRay(soplex)
    ccall((:SoPlex_hasPrimalRay, libsoplex_library), Bool, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_isDualFeasible(soplex)

### Prototype
```c
bool SoPlex_isDualFeasible(void* soplex);
```
"""
function SoPlex_isDualFeasible(soplex)
    ccall((:SoPlex_isDualFeasible, libsoplex_library), Bool, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_hasDualFarkas(soplex)

### Prototype
```c
bool SoPlex_hasDualFarkas(void* soplex);
```
"""
function SoPlex_hasDualFarkas(soplex)
    ccall((:SoPlex_hasDualFarkas, libsoplex_library), Bool, (Ptr{Cvoid},), soplex)
end

"""
    SoPlex_basisRowStatus(soplex, rowidx::Cint)

### Prototype
```c
SoPlex_VarStatusEnum SoPlex_basisRowStatus(void* soplex, int rowidx);
```
"""
function SoPlex_basisRowStatus(soplex, rowidx::Cint)
    ccall((:SoPlex_basisRowStatus, libsoplex_library), Cint, (Ptr{Cvoid}, Cint), soplex, rowidx)
end

"""
    SoPlex_basisColStatus(soplex, colidx::Cint)

### Prototype
```c
SoPlex_VarStatusEnum SoPlex_basisColStatus(void* soplex, int colidx);
```
"""
function SoPlex_basisColStatus(soplex, colidx::Cint)
    ccall((:SoPlex_basisColStatus, libsoplex_library), Cint, (Ptr{Cvoid}, Cint), soplex, colidx)
end

"""
    SoPlex_getRowVectorReal(soplex, i::Cint, nnonzeros, indices, coefs)

### Prototype
```c
void SoPlex_getRowVectorReal(void* soplex, int i, int* nnonzeros, long* indices, double* coefs);
```
"""
function SoPlex_getRowVectorReal(soplex, i::Cint, nnonzeros, indices, coefs)
    ccall((:SoPlex_getRowVectorReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Clong}, Ptr{Cdouble}), soplex, i, nnonzeros, indices, coefs)
end

"""
    SoPlex_getRowVectorRational(soplex, i::Cint, nnonzeros, indices, coefsnum, coefsdenom)

### Prototype
```c
void SoPlex_getRowVectorRational(void* soplex, int i, int* nnonzeros, long* indices, SoPlex_RatIntType* coefsnum, SoPlex_RatIntType* coefsdenom);
```
"""
function SoPlex_getRowVectorRational(soplex, i::Cint, nnonzeros, indices, coefsnum, coefsdenom)
    ccall((:SoPlex_getRowVectorRational, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint, Ptr{Cint}, Ptr{Clong}, Ptr{SoPlex_RatIntType}, Ptr{SoPlex_RatIntType}), soplex, i, nnonzeros, indices, coefsnum, coefsdenom)
end

"""
    SoPlex_getRowBoundsReal(soplex, i::Cint, lb, ub)

### Prototype
```c
void SoPlex_getRowBoundsReal(void* soplex, int i, double* lb, double* ub);
```
"""
function SoPlex_getRowBoundsReal(soplex, i::Cint, lb, ub)
    ccall((:SoPlex_getRowBoundsReal, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint, Ptr{Cdouble}, Ptr{Cdouble}), soplex, i, lb, ub)
end

"""
    SoPlex_getRowBoundsRational(soplex, i::Cint, lbnum, lbdenom, ubnum, ubdenom)

### Prototype
```c
void SoPlex_getRowBoundsRational(void* soplex, int i, SoPlex_RatIntType* lbnum, SoPlex_RatIntType* lbdenom, SoPlex_RatIntType* ubnum, SoPlex_RatIntType* ubdenom);
```
"""
function SoPlex_getRowBoundsRational(soplex, i::Cint, lbnum, lbdenom, ubnum, ubdenom)
    ccall((:SoPlex_getRowBoundsRational, libsoplex_library), Cvoid, (Ptr{Cvoid}, Cint, Ptr{SoPlex_RatIntType}, Ptr{SoPlex_RatIntType}, Ptr{SoPlex_RatIntType}, Ptr{SoPlex_RatIntType}), soplex, i, lbnum, lbdenom, ubnum, ubdenom)
end

