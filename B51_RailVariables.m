function [Track] = B51_RailVariables(Track,Calc)

% Definition of variables related to the Track

% -------------------------------------------------------------------------
% % ---- Inputs ----
% Track = Structure with Track variables, including at least:
%   ... see script ...
% Calc = Structure with Calculation variables, including at least:
%   ... see script ...
% % ---- Outputs ----
% Track = Additional fields to Track structure variable
%   ... see script ...
% -------------------------------------------------------------------------

Track.Rail.Prop.L = Calc.Profile.L;
Track.Rail.Prop.A = 1;
Track.Rail.Mesh.Ele.num = ... 
    round(Track.Rail.Prop.L/Track.Sleeper.spacing*Track.Rail.Mesh.Ele.num_per_spacing);
Track.Rail.Options.k_Mconsist = 1;

if Calc.Options.redux == 0
    % Boundary conditions - None
    Track.Rail.BC.loc = [];
    Track.Rail.BC.vert_stiff = [];
    Track.Rail.BC.rot_stiff = [];
elseif Calc.Options.redux == 1
    % Boundary conditions - Simply supported
    Track.Rail.BC.loc = [0,Track.Rail.Prop.L];
    Track.Rail.BC.vert_stiff = [-1,-1];
    Track.Rail.BC.rot_stiff = [0,0];
end % if Calc.Options.redux == 0

% ---- End of script ----