%%% FerriteImpedance.m
% A MATLAB script to model the impedance response of a ferrite bead.
%
% Author: James Bao

%% Sanitise Workspace
clear;
close all;
clc;

fprintf("FerriteBead.m\n\n");

%% Model Parameters

% Series Resistance
Rs = 0.3;

% Parasitic Capacitance
Cpar = 1.678e-12;

% Bead Inductance
Lbead = 1.208e-6;

% AC Resistance
Rac = 1.082e3;

%% Transfer Function

X_Cpar = tf(1, [Cpar 0]);
X_Lbead = tf([Lbead 0], 1);

Z = Rs + (1 / ((1/X_Cpar) + (1/X_Lbead) + (1/Rac)));

%% Plot Frequency Response

[mag, phase, w] = bode(Z, {0.1e6, 100e9});

w = w / (2 * pi * 1e6); % Convert w to f

semilogx(w, squeeze(mag));

xlabel('Frequency (MHz)', 'FontSize', 24);
ylabel('Impedance (Ohms)', 'FontSize', 24);
title('Impedance Response of Ferrite Bead Model', 'FontSize', 28);
