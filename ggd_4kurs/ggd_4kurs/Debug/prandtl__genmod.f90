        !COMPILER-GENERATED INTERFACE MODULE: Fri Dec 16 14:21:48 2022
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE PRANDTL__genmod
          INTERFACE 
            SUBROUTINE PRANDTL(U_N,V_N,NI,NJ,DX,DY,P_N,NU,U0,SMAX,EPS,  &
     &RHO,P0,R0,GAMMA,METHOD)
              INTEGER(KIND=4) :: NJ
              INTEGER(KIND=4) :: NI
              REAL(KIND=4) :: U_N(NI,NJ)
              REAL(KIND=4) :: V_N(NI,NJ)
              REAL(KIND=4) :: DX
              REAL(KIND=4) :: DY
              REAL(KIND=4) :: P_N(NI)
              REAL(KIND=4) :: NU
              REAL(KIND=4) :: U0
              INTEGER(KIND=4) :: SMAX
              REAL(KIND=4) :: EPS
              REAL(KIND=4) :: RHO(NI)
              REAL(KIND=4) :: P0
              REAL(KIND=4) :: R0
              REAL(KIND=4) :: GAMMA
              INTEGER(KIND=4) :: METHOD
            END SUBROUTINE PRANDTL
          END INTERFACE 
        END MODULE PRANDTL__genmod
