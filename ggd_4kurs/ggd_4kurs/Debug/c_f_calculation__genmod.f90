        !COMPILER-GENERATED INTERFACE MODULE: Thu Dec 15 16:56:35 2022
        ! This source file is for reference only and may not completely
        ! represent the generated interface used by the compiler.
        MODULE C_F_CALCULATION__genmod
          INTERFACE 
            SUBROUTINE C_F_CALCULATION(NU,RHO,NI,NJ,DY,U0,U_N,C_F)
              INTEGER(KIND=4) :: NJ
              INTEGER(KIND=4) :: NI
              REAL(KIND=4) :: NU
              REAL(KIND=4) :: RHO(NI)
              REAL(KIND=4) :: DY
              REAL(KIND=4) :: U0
              REAL(KIND=4) :: U_N(NI,NJ)
              REAL(KIND=4) :: C_F(NI,NJ)
            END SUBROUTINE C_F_CALCULATION
          END INTERFACE 
        END MODULE C_F_CALCULATION__genmod
