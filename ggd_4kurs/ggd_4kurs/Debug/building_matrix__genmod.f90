        !COMPILER-GENERATED INTERFACE MODULE: Wed Dec 14 17:59:07 2022
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE BUILDING_MATRIX__genmod
          INTERFACE 
            SUBROUTINE BUILDING_MATRIX(NJ,A,B,C,MATRIX)
              INTEGER(KIND=4) :: NJ
              REAL(KIND=4) :: A(NJ)
              REAL(KIND=4) :: B(NJ)
              REAL(KIND=4) :: C(NJ)
              REAL(KIND=4) :: MATRIX(NJ,NJ)
            END SUBROUTINE BUILDING_MATRIX
          END INTERFACE 
        END MODULE BUILDING_MATRIX__genmod
