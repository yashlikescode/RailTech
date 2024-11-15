function [Veh] = B08_VehFreq(Veh,Calc)

% Calculates all vehicle frequencies given their system matrices


% -------------------------------------------------------------------------
% ---- Input ----
% Veh = Indexed Structure with Vehicle variables, including at least:
%   .Mg = Vehicle global Mass matrix
%   .Kg = Vehicle global Stiffness matrix
%   .Tnum_DOF = Number of DOF of the vehicle
% Calc = Structure with Calc's variables, including at least:
%   .Options.calc_veh_frq = If value = 1, vehicle's natural frequencies are calculated
% ---- Output ----
% Veh = Addition of fields to structure Veh:
%   .w = Circular frequencies of vehicle
%   .f = Frequencies of vehicle
% -------------------------------------------------------------------------

% To obtain the natural frequencies, simply calculate the eigenvalues of
% the dynamic system. 
% For M*xddot + C*xdot + K*xdot = F
% No damping and no external force is considered, then calculate:
% eig(M\F)

if Calc.Options.calc_veh_frq == 1

    for veh_num = 1:Veh(1).Tnum
        % ---- Eigenvalue analysis ----
        aux1 = eig(Veh(veh_num).SysM.K,Veh(veh_num).SysM.M);
        Veh(veh_num).Modal.w = sqrt(aux1);                      % Vehicle circuar frequencies
        Veh(veh_num).Modal.f = Veh(veh_num).Modal.w/(2*pi);     % Vehicle frequecies (Hz)

    end % for veh_num = 1:Veh(1).Tnum

end % if Calc.Options.calc_veh_frq == 1

% ---- End of function ----