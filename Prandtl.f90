
!************************************************************************************************      
      SUBROUTINE Prandtl(U_n, V_n, NI, NJ, dx, dy, P_n, NU, U0, SMAX, EPS, RHO, P0, R0, Gamma, Method)
      IMPLICIT NONE
      real:: U_n(NI,NJ), V_n(NI,NJ), P_n(NI), A(NJ), B(NJ), C(NJ), D(NJ), F(NJ), RHO(NI), F_NEW(NJ), D_NEW(NJ), U_sp(NJ), V_sp(NJ) 
      real dx, dy, NU, U0, EPS, NORM_U, NORM_V, R0, P0, Gamma, sum1, sum2, sum3
      integer:: NI, NJ, i, j, S, SMAX, method
      A(1) = 0
      B(1) = -1  !условие симметрии
      C(1) = 1
      D(1) = 0
      A(NJ) = 0
      B(NJ) = 1 !условие приллипания
      C(NJ) = 0
      D(NJ) = 0
      F(1) = 0
      F(NJ) = 0
      U_n(1,:) = U0
      V_n(1,:) = 0
      V_n(:, 1) = 0
      P_n(:) = P0
      RHO(1) = R0
      do i = 2, NI
          S = 1
          NORM_U = 10.0
          NORM_V = 10.0
              U_n(i, :) = U_n(i-1, :)
              V_n(i, :) = V_n(i-1, :)
              do while (S .LE. SMAX .and. MAX(NORM_U, NORM_V) .GE. EPS)
              U_sp(:) = U_n(i, :)
              V_sp(:) = V_n(i, :)
              do j = 2, NJ-1
                  A(j) = -V_n(i,j-1)/(2*dy) - NU/(dy)**2
                  B(j) = U_n(i,j)/dx + NU*2/(dy)**2
                  C(j) = V_n(i,j+1)/(2*dy) - NU/(dy)**2
                  if (method == 1) then
                  D(j) = U_n(i-1,j)**2/dx + P_n(i-1)/dx 
                  else
                  D(j) = RHO(i-1)*U_n(i-1,j)**2/dx + P_n(i-1)/dx
                  end if
                  F(j) = real(1)/dx
              end do
              call Progonka(NJ, A, B, C, D, D_new)
              call Progonka(NJ, A, B, C, F, F_new)
              sum1 = 0.0
              sum2 = 0.0
              sum3 = 0.0
              
              do j = 2, NJ
                  sum1 = sum1 + D_New(j) + D_new(j-1)
                  if (method == 1) then
                  sum2 = sum2 + (U_n(i-1,j) + U_n(i-1,j-1))    
                  else
                  sum2 = sum2 + RHO(i-1)*(U_n(i-1,j) + U_n(i-1,j-1))
                  end if
                  sum3 = sum3 + F_new(j) + F_new(j-1)
              end do
              P_n(i) = (sum1 - sum2)/sum3
              if (method == 2) then
              RHO(i) = RHO(i-1)*(P_n(i)/P_n(i-1))**(real(1)/Gamma)
              end if
              do j = 1, NJ
                  U_n(i, j) = D_New(j) - F_New(j) * P_n(i)
                  if (method == 2) then
                  U_n(i, j) = U_n(i, j)/RHO(i)
                  end if
              end do
              do j = 2, NJ
                  if (method == 1) then
                  V_n(i,j) =  V_n(i, j-1) -  dy/2*((U_n(i,j)-U_n(i-1,j))/dx + (U_n(i,j-1) - U_n(i-1, j-1))/dx)
                  !print *, dy/2; pause
                  else
                  V_n(i,j) =  RHO(i)*V_n(i, j-1) -  dy/2*((RHO(i)*U_n(i,j)-RHO(i-1)*U_n(i-1,j))/dx + (RHO(i)*U_n(i,j-1) - RHO(i-1)*U_n(i-1, j-1))/dx)
                  V_n(i,j) = V_n(i,j)/RHO(i)           
                  end if
              end do
              
              NORM_U = MAXVAL(ABS(U_n(i,:)-U_sp(:)))/MAXVAL(ABS(U_sp(:)))
              NORM_V = MAXVAL(ABS(V_n(i,:)-V_sp(:)))/MAXVAL(ABS(V_sp(:)))
              !print *, NORM_u
              S = S + 1
              end do
              print *, S
              !pause
      end do
    
    END SUBROUTINE
    
   

    
