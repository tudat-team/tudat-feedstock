clc
close all
clear all

directory = '/home/dominic/Software/NumericalAstrodynamics2021_solutions/Assignment2/SimulationOutput/';

lambert = load(strcat(directory,'Q2a_2_lambert_states.dat'));
numerical = load(strcat(directory,'Q2a_2_numerical_states.dat'));
difference = numerical - lambert;

plot(lambert(:,1),difference(:,2))
hold on
plot(lambert(:,1),difference(:,3))
plot(lambert(:,1),difference(:,4))
