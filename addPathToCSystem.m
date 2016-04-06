% Script file that adds the Kernel subdirectories to the path.
%
% Call this script before working with the Matlab CSSystem Toolbox
%   (or place it in your startup.m file).

% Proper operation of function handles seems to require an absolute path
%   (at least for Matlab version 6.5).

path_to_cjsr = '/home/blegat/git/cjsr/';
addpath(genpath([path_to_cjsr, 'core']));
addpath(genpath([path_to_cjsr, 'core/complexPolytopeTools']));
addpath(genpath([path_to_cjsr, 'core/concatTools']));
addpath(genpath([path_to_cjsr, 'core/graphTools']));
addpath(genpath([path_to_cjsr, 'core/jsrTools']));
addpath(genpath([path_to_cjsr, 'core/mextools']));
addpath(genpath([path_to_cjsr, 'core/quadTools']));
addpath(genpath([path_to_cjsr, 'core/sosTools']));
addpath(genpath([path_to_cjsr, 'core/utils']));
addpath(genpath([path_to_cjsr, 'demo']));
addpath(genpath([path_to_cjsr, 'demo/demo']));
addpath(genpath([path_to_cjsr, 'demo/examples']));
addpath(genpath([path_to_cjsr, 'demo/gettingStartedUtils']));
addpath(genpath([path_to_cjsr, 'benchmarks']));

