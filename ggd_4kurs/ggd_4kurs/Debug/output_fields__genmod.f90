        !COMPILER-GENERATED INTERFACE MODULE: Thu Dec 15 16:52:31 2022
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE OUTPUT_FIELDS__genmod
          INTERFACE 
            SUBROUTINE OUTPUT_FIELDS(IO,NI,NJ,X,Y,U,V,P,R_N,C_F)
              INTEGER(KIND=4) :: NJ
              INTEGER(KIND=4) :: NI
              INTEGER(KIND=4) :: IO
              REAL(KIND=4) :: X(NI,NJ)
              REAL(KIND=4) :: Y(NI,NJ)
              REAL(KIND=4) :: U(NI,NJ)
              REAL(KIND=4) :: V(NI,NJ)
              REAL(KIND=4) :: P(NI,NJ)
              REAL(KIND=4) :: R_N(NI,NJ)
              REAL(KIND=4) :: C_F(NI,NJ)
            END SUBROUTINE OUTPUT_FIELDS
          END INTERFACE 
        END MODULE OUTPUT_FIELDS__genmod
