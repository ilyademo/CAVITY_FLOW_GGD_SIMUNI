        !COMPILER-GENERATED INTERFACE MODULE: Tue Dec 13 20:26:29 2022
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE GETTING_NEW_COEFF__genmod
          INTERFACE 
            SUBROUTINE GETTING_NEW_COEFF(MATRIX_NEW,F,D,NJ,F_NEW,D_NEW)
              INTEGER(KIND=4) :: NJ
              REAL(KIND=4) :: MATRIX_NEW(NJ,NJ)
              REAL(KIND=4) :: F(NJ)
              REAL(KIND=4) :: D(NJ)
              REAL(KIND=4) :: F_NEW(NJ)
              REAL(KIND=4) :: D_NEW(NJ)
            END SUBROUTINE GETTING_NEW_COEFF
          END INTERFACE 
        END MODULE GETTING_NEW_COEFF__genmod
