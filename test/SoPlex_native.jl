import SoPlex
using Test

function test_real()
   # create LP via columns 

   soplex = SoPlex.SoPlex_create()
   infty = 10e+20
   colentries1 = [-1.0]
   colentries2 = [1.0]
   lhs = [-10.0]
   primal = [0.0,0.0]

   # quiet(ish)
   SoPlex.SoPlex_setIntParam(soplex, SoPlex.VERBOSITY, SoPlex.VERBOSITY_ERROR)

   # minimize 
   SoPlex.SoPlex_setIntParam(soplex, SoPlex.OBJSENSE, SoPlex.OBJSENSE_MINIMIZE)

   # add columns 
   SoPlex.SoPlex_addColReal(soplex, colentries1, 1, 1, 1.0, 0.0, infty)
   SoPlex.SoPlex_addColReal(soplex, colentries2, 1, 1, 1.0, -infty, infty)
   @test SoPlex.SoPlex_numRows(soplex) == 1
   @test SoPlex.SoPlex_numCols(soplex) == 2

   # set lhs of constra
   SoPlex.SoPlex_changeLhsReal(soplex, lhs, 1)

   # optimize and get solution and objective value 
   result = SoPlex.SoPlex_optimize(soplex)
   @test result == 1
   SoPlex.SoPlex_getPrimalReal(soplex, primal, 2)
   @test (primal[1] == 0.0) && (primal[2] == -10.0)
   @test SoPlex.SoPlex_objValueReal(soplex) == -10.0

   SoPlex.SoPlex_free(soplex)

   # create LP via rows 

   soplex2 = SoPlex.SoPlex_create()
   rowentries1 = [-1.0, 1.0]
   lb = [0.0, -infty]
   ub = [infty, infty]
   obj = [1.0, 1.0]

   # minimize 
   SoPlex.SoPlex_setIntParam(soplex2, 0, -1)

   # add row 
   SoPlex.SoPlex_addRowReal(soplex2, rowentries1, 2, 2, -10.0, infty)

   # add variable bounds 
   SoPlex.SoPlex_changeBoundsReal(soplex2, lb, ub, 2)
   @test SoPlex.SoPlex_numRows(soplex2) == 1
   @test SoPlex.SoPlex_numCols(soplex2) == 2

   # add objective 
   SoPlex.SoPlex_changeObjReal(soplex2, obj, 2)

   # optimize and get solution and objective value 
   result = SoPlex.SoPlex_optimize(soplex2)
   @test result == 1
   SoPlex.SoPlex_getPrimalReal(soplex2, primal, 2)
   @test (primal[1] == 0.0) && (primal[2] == -10.0)
   @test SoPlex.SoPlex_objValueReal(soplex2) == -10.0

   SoPlex.SoPlex_free(soplex2)
end

function test_rational()
   # create LP via rows 

   soplex = SoPlex_create()
   infty = 1000000
   rownums = [-1, 1]
   rowdenoms = [1, 1]
   objnums = [1, 1]
   objdenoms = [1, 1]
   primal = [0.0,0.0]

   # use rational solver 
   SoPlex_setRational(soplex)

   # minimize 
   SoPlex_setIntParam(soplex, 0, -1)

   # add row and set objective function 
   SoPlex_addRowRational(soplex, rownums, rowdenoms, 2, 2, 1, 5, infty, 1)
   SoPlex_changeObjRational(soplex, objnums, objdenoms, 2)

   # optimize and check rational solution and objective value 
   result = SoPlex_optimize(soplex)
   @test result == 1
   # note trailing space in string
   @test SoPlex.strcmp(SoPlex_getPrimalRationalString(soplex, 2), "0 1/5 ") == 0
   # @test SoPlex.strcmp(SoPlex_objValueRationalString(soplex), "1/5") == 0
   ratString = unsafe_string(SoPlex_objValueRationalString(soplex))
   @test ratString == "1/5"

   SoPlex_free(soplex)

   # create LP via columns 
   soplex2 = SoPlex_create()
   colnums1 = [-1]
   coldenoms1 = [1]
   colnums2 = [1]
   coldenoms2 = [1]
   lhsnums = [-1]
   lhsdenoms = [5]

   # use rational solver 
   SoPlex_setRational(soplex2)

   # minimize 
   SoPlex_setIntParam(soplex2, 0, -1)

   # add cols 
   SoPlex_addColRational(soplex2, colnums1, coldenoms1, 1, 1, 1, 5, 0, 1, infty, 1)
   SoPlex_addColRational(soplex2, colnums2, coldenoms2, 1, 1, 1, 5, -infty, 1, infty, 1)

   # add bounds to constra
   SoPlex_changeLhsRational(soplex2, lhsnums, lhsdenoms, 1)

   # optimize and check rational solution and objective value 
   result = SoPlex_optimize(soplex2)
   @test result == 1
   # note trailing space in string
   @test SoPlex.strcmp(SoPlex_getPrimalRationalString(soplex2, 2), "0 -1/5 ") == 0
   # @test SoPlex.strcmp(SoPlex_objValueRationalString(soplex2), "-1/25 ") == 0
   ratString = unsafe_string(SoPlex_objValueRationalString(soplex))
   @test ratString ==  "-1/25"


   SoPlex_free(soplex2)
end

@testset "SoPlex Float API tests" begin
   test_real()
end

@testset "SoPlex With GMP" begin
   @test SoPlex_Supports_Rational
end

if SoPlex_Supports_Rational
   @testset "SoPlex Rational API tests" begin
      test_rational()
   end
end
