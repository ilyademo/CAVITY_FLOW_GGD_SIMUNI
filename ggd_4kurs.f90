        Program Pr
        Implicit none
 
        INTEGER, PARAMETER:: IO = 12 ! input-output unit
        INTEGER NI, NJ, NITER, SMAX
        INTEGER I,J, method
        REAL L,H,U0,Nu,R0,P0, Gamma, L_beg
        REAL dx,dy,CFL,EPS
        REAL,ALLOCATABLE :: X_Node(:,:),Y_Node(:,:)
        REAL,ALLOCATABLE :: U_n(:,:),V_n(:,:),P_n(:),R_n(:,:), RHO(:), P(:,:), C_f(:, :)

        write(*,*) 'Read input file'
        open(IO,FILE='Input.txt')
        read(IO,*) L
        read(IO,*) H
        read(IO,*) NI
        read(IO,*) NJ
        read(IO,*) EPS
        read(IO,*) SMAX

        read(IO,*) U0
        read(IO,*) Gamma
        read(IO,*) R0
        read(IO,*) P0
        read(IO,*) NU
        read(IO,*) method
        CLOSE(IO)
   
        allocate(X_Node(NI,NJ)) ! mesh nodes X-coordinates
        allocate(Y_Node(NI,NJ)) ! mesh nodes Y-coordinates

!----------------- Node variables -----------------------------
        allocate(U_n(NI,NJ))  ! Velocity U
        allocate(V_n(NI,NJ))   ! Velocity V
        allocate(R_n(NI,NJ))  ! 
        allocate(P(NI,NJ))
        allocate(P_n(NI))  ! Pressure
        allocate(RHO(NI))
        allocate(C_f(NI, NJ))
!----------------- Coordinate of nodes ------------------------
        dx=L/(NI-1)
        dy=H/(NJ-1)

        DO I=1,NI
          DO J=1,NJ
            X_Node(I,J)=(I-1)*dx
            Y_Node(I,J)=(J-1)*dy
          END DO
        END DO

!----------------- Parameters ------------------------


        write(*,*)'L= ', L, 'NI= ', NI, 'dx= ', dx
        write(*,*)'H= ', H, 'NJ= ', NJ, 'dy= ', dy
        write(*,*)'ReH= ', U0*2*H/NU
        write(*,*)'L_beg=', U0*4*H**2/NU*0.04
        write(*,*)'M=', U0/sqrt(Gamma*P0/R0)
        pause    

!----------------- Initial fields -----------------------------

        DO I=1,NI
            RHO(i) = R0
            U_n(I,1)=U0
            P_n(1)=P0
            V_n(I,1)=1.0e-5
        ENDDO

!---------------- Solve Prandtl equations ---------------------
 
        write(*,*) 'Solve Prandtl equations'      
        call  Prandtl(U_n, V_n, NI, NJ, dx, dy, P_n, NU, U0, SMAX, EPS, RHO, P0, R0, Gamma, Method)
        do i = 1, NI
            P(i, :) = P_n(i)
            R_n(i, :) = RHO(i)
        end do
        call C_f_calculation(NU, RHO, NI, NJ, dy, U0, U_n, C_f)
       
        
 !----------------- Output data ------------------------------
 
        write(*,*) 'Output data' 
        if (method == 1) then
        Open(IO,FILE='Results_incompressible.plt')
        else
        Open(IO,FILE='Results_compressibleRho11.plt')
        endif
        Call Output_Fields(IO,NI,NJ,X_Node,Y_Node,U_n,V_n,P,R_n, C_f)
        Close(IO)
        deallocate(X_Node,Y_Node, U_n,V_n,P_n,R_n, RHO, P, C_f)
        END PROGRAM
   
