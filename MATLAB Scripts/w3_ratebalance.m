% % Rate-balance plots

%{

% % [A ] => k_plus  => [A*]
% % [A*] => k_minus => [A ]
% % 1) Linear system with no feedback, forward rate depends on [S]
% -> constant forward rate

% Variable of interest: A* (Astar): assumed to be normalized to the
% quantity [A]_total, so ranges from 0 to 1
Astar = 0:0.001:1 ;

% stimulus A
S = 0.5:0.5:20 ;

% kplus rate and kminus rate
kplus = 2 ;
kminus = 5 ;

% Backward Rates: BR = k_minus * A*
BR = kminus * Astar ;

figure
hold on 
plot(Astar, BR, 'r', 'LineWidth', 2)
set(gca, 'TickDir', 'Out')
xlabel('[A*]/[A]')
ylabel('Rates')

for i=1:length(S)
  % Forward Rates: FR = k_plus * (A_total - A*)
  FR = kplus * S(i) * (1 - Astar) ;
  [minpos,dex] = min(abs(FR - BR)) ;
  A_SS(i) = Astar(dex) ;
  plot(Astar,FR,'b','LineWidth',2)
end
axis([0 1 0 max(FR)])

figure
plot(S,A_SS,'bo-','LineWidth',2)
set(gca,'TickDir','Out')
xlabel('Stimulus [S]')
ylabel('Steady-state [A*]/[A]')

% % Rate-balance plots
% % 
% % 2) Ultrasensitive feedback, variable [S]
% -> an ultrasensitave autocatalytic feedback that causes the FR to be
% highly nonlinear.

Astar = 0:0.01:1 ;
S = 0:0.02:0.5 ;
kplus = 2 ;
kfs = 30 ;
Kmf = 0.5 ;
kminus = 5 ;
h = 4 ; % exponent

BR = kminus*Astar ;
figure
handle1 = gcf ;
hold on 
plot(Astar,BR,'r','LineWidth',2)
set(gca,'TickDir','Out')

figure
handle2 = gcf ;
hold on

for i=1:length(S)
  FR = (kplus*S(i)+kfs*(Astar.^h./(Astar.^h+Kmf^h))).*(1-Astar) ;
  figure(handle1)
  plot(Astar,FR,'b','LineWidth',2)
  
  crossings = [] ;
  difference = FR-BR ;
  for iii=2:length(FR)
    if (sign(difference(iii)) ~= sign(difference(iii-1)))
      crossings = [crossings,iii] ;
    end
  end
  figure(handle2)
  plot(S(i),Astar(crossings),'bo')
  
end
figure(handle1)
axis([0 1 0 max(FR)])
set(gca,'TickDir','Out')
xlabel('[A*]/[A]')
ylabel('Rates')

figure(handle2)
set(gca,'TickDir','Out')
xlabel('Stimulus [S]')
ylabel('Steady-state [A*]/[A]')

% ----- Assignment 3 -----
% Question 1. which plot represents a case where bistability presents
% when there are two fixed points, and direction points to the two points

% Question 2.
% kminus =  5, Kmb = 0.1, kplus = 2, kf = 30, stimulus is zero
% - test several different values of Kmb, 
% - determine whcih values of Kmb produce bistability

Astar = 0:0.01:1 ;
S = 1 ;
kplus  = 2 ;
kminus = 5 ;
kf     = 30 ;

% test Kmb
Kmb = 1 ;
% Kmb = 0:0.1:1
% FR function
FR = (kplus.^h .* S + kf.^h .* Astar.^h) * S .* (1 - Astar.^h) ;

figure
handle1 = gcf ;
hold on 
plot(Astar, FR, 'r', 'LineWidth', 2)
set(gca,'TickDir','Out')

for i = 1:length(Kmb)
  % BR function
  BR = kminus.^h .* Astar.^h ./ (Astar.^h + Kmb(i).^h) ;
  
  figure(handle1)
  plot(Astar, BR,'b','LineWidth',2)
 
  crossings = [] ;
  difference = FR-BR ;
  for iii=2:length(BR)
    if (sign(difference(iii)) ~= sign(difference(iii-1)))
      crossings = [crossings,iii] ;
    end
  end
  
end

figure(handle1)
axis([0 1 0 max(BR)])
set(gca,'TickDir','Out')
xlabel('[A*]/[A]')
ylabel('Rates')

% Question 3.
% kminus =  5, Kmb = 0.1, kplus = 2, kf = 30, stimulus is zero
% - test several S
% - determine whcih values of Kmb produce bistability

Astar = 0:0.01:1 ;
S = 0:1:10 ;
kplus  = 2 ;
kminus = 5 ;
kf     = 30 ;
Kmb = 1 ;

BR = kminus.^h .* Astar.^h ./ (Astar.^h + Kmb.^h) ;
figure
handle1 = gcf ;
hold on 
plot(Astar,BR,'r','LineWidth',2)
set(gca,'TickDir','Out')

figure
handle2 = gcf ;
hold on

for i=1:length(S)
  FR = (kplus.^h .* S(i) + kf.^h .* Astar.^h) * S(i) .* (1 - Astar.^h)
  figure(handle1)
  plot(Astar,FR,'b','LineWidth',2)
  
  crossings = [] ;
  difference = FR-BR ;
  for iii=2:length(FR)
    if (sign(difference(iii)) ~= sign(difference(iii-1)))
      crossings = [crossings,iii] ;
    end
  end
  figure(handle2)
  plot(S(i),Astar(crossings),'bo')
  
end
figure(handle1)
axis([0 1 0 max(FR)])
set(gca,'TickDir','Out')
xlabel('[A*]/[A]')
ylabel('Rates')

figure(handle2)
set(gca,'TickDir','Out')
xlabel('Stimulus [S]')
ylabel('Steady-state [A*]/[A]')

% Question 4.
Astar = 0:0.01:1 ;
S = 0:0.02:0.5 ;

kminus = 5   ;
Kmb    = 0.5 ;
kplus  = 0.5 ;
kfs    = 30  ;
Kmf    = 0.5 ;
h      = 4   ; 

BR = kminus*Astar ;
figure
handle1 = gcf ;
hold on 
plot(Astar,BR,'r','LineWidth',2)
set(gca,'TickDir','Out')

figure
handle2 = gcf ;
hold on

for i=1:length(S)
  FR = (kplus*S(i)+kfs*(Astar.^h./(Astar.^h+Kmf^h))).*(1-Astar) ;
  figure(handle1)
  plot(Astar,FR,'b','LineWidth',2)
  
  crossings = [] ;
  difference = FR-BR ;
  for iii=2:length(FR)
    if (sign(difference(iii)) ~= sign(difference(iii-1)))
      crossings = [crossings,iii] ;
    end
  end
  figure(handle2)
  plot(S(i),Astar(crossings),'bo')
  
end
figure(handle1)
axis([0 1 0 max(FR)])
set(gca,'TickDir','Out')
xlabel('[A*]/[A]')
ylabel('Rates')

figure(handle2)
set(gca,'TickDir','Out')
xlabel('Stimulus [S]')
ylabel('Steady-state [A*]/[A]')

% Question 5.
% dldt = beta * lext * LacY - gamma * l
% dLacYdt = delta + p * (l^4 / (l^4 + l0^4)) - tau * LacY 
% lext: extracellular lactose
beta  = 1   ;
gamma = 1   ;
delta = 0.2 ;
l0    = 4   ;
p     = 4   ;
tau   = 1   ;

dt = 0.05;
tlast = 5;
iterations = round(tlast / dt) ;

l_all    = zeros(iterations, 1) ;
LacY_all = zeros(iterations, 1) ;

% Initial Condition
l = l0;
LacY = (delta + p / 2) / tau ;

% to plot the nullclines of this model for lext = 2.5
lext = 2.5 ;
for i = 1:iterations
    l_all(i)    = l    ;
    LacY_all(i) = LacY ;

    dldt = beta * lext .* LacY - gamma * l ;
    dLacYdt = delta + p .* (l^4 ./ (l^4 + l0^4)) - tau * LacY ;

    l    = l    + dldt * dt ;
    LacY = LacY + dLacYdt * dt ;
end

time = dt * (0:iterations - 1)';
figure
plot(time, l_all, "red")
figure
plot(time, LacY_all, "blue")

% Question 6.
colors = repmat('krgbmc',1,300) ;

%%% 1:  Define constants 
beta  = 1   ;
gamma = 1   ;
delta = 0.2 ;
l0    = 4   ;
p     = 4   ;
tau   = 1   ;
lext  = 2.5 ;

%%% 2:  Define parameters that will be varied 
l_list    = [8,   3,   3, 2] ;
LacY_list = [3, 1.3, 1.4, 1] ;
tests  = length(l_list) ;

figure
hold on 
for m = 1:tests
    
    l = l_list(m) ;
    LacY = LacY_list(m) ;
   
    %%% 3:  Define time step, simulation time, initialize matrices 
    dt    = 5e-3 ; % s 
    tlast = 5 ;  % s
    iterations = fix(tlast/dt) ;
    time = dt*(0:iterations-1) ;
    l_all    = zeros(iterations, 1) ;
    LacY_all = zeros(iterations, 1) ;
    
    %%% 4:  Run for different values of l & LacY
    for i = 1:iterations % different values of l
        l_all(i)    = l    ;
        LacY_all(i) = LacY ;
        dl    = beta * lext * LacY - gamma * l ;
        dLacY = delta + p * (l^4 ./ (l^4 + l0^4)) - tau * LacY ;
        l    = l    + dt * dl ;
        LacY = LacY + dt * dLacY ;
        l_all(i)    = l;
        LacY_all(i) = LacY ;
    end 
    plot(time, l_all, [colors(m),'-'], 'LineWidth',2.2)
    plot(time, LacY_all, [colors(m),':'], 'LineWidth',2.2)
    xlabel('time (s)')
    ylabel('[R] (uM)')
    set(gca,'TickDir','Out')
end
%}


% Question 6.
colors = repmat('krgbmc',1,300) ;
beta  = 1   ;
gamma = 1   ;
delta = 0.2 ;
l0    = 4   ;
p     = 4   ;
tau   = 1   ;

l = 10;
LacY = 1 ;
% choice 1: not bistable
% l = 2;
% LacY = 0.1 ;

% choice 2: will not change theh bifurcation points
% l = 4;
% LacY = 2 ;

% text different lext
% lext  = 1:0.1:7 ;

% choice 3:
% lext  = 2:0.1:4 ;

% choice 4:
% lext  = 6:0.1:10 ;

dt    = 0.05 ;
tlast = 5 ;
iterations = fix(tlast/dt) ;
time = dt*(0:iterations-1) ;

l_all    = zeros(iterations, 1) ;
LacY_all = zeros(iterations, 1) ;

figure
hold on 
for i = 1:length(lext) %
    l_all(i)    = l    ;
    LacY_all(i) = LacY ;
    dl    = beta * lext(i) * LacY - gamma * l ;
    dLacY = delta + p * (l^4 ./ (l^4 + l0^4)) - tau * LacY ;
    l    = l    + dt * dl ;
    LacY = LacY + dt * dLacY ;
    l_all(i)    = l;
    LacY_all(i) = LacY ;
end 
plot(l_all, LacY_all, [colors(1),'-'], 'LineWidth',2.2)
xlabel('time (s)')
ylabel('[R] (uM)')
set(gca,'TickDir','Out')

