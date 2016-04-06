clc ; close all ; clear all ;

% The system presented in Example 1 is the following
S2 = benchmarkPaper() ;

% Solving Program 1 by bisection on gamma:
[ub1, Qprimal2,  Qdual2, ~]   =  S2.cjsrQuadMultinorm() ;
S4  = S2.sosLift(2) ;
[ub2, Qprimal4,  Qdual4, ~]   =  S4.cjsrQuadMultinorm() ;
S6  = S2.sosLift(3) ;
[ub3, Qprimal6,  Qdual6, ~]   =  S6.cjsrQuadMultinorm() ;
S8  = S2.sosLift(4) ;
[ub4, Qprimal8,  Qdual8, ~]   =  S8.cjsrQuadMultinorm() ;
S10 = S2.sosLift(5) ;
[ub5, Qprimal10, Qdual10, ~] = S10.cjsrQuadMultinorm() ;
S12 = S2.sosLift(6) ;
[ub6, Qprimal12, Qdual12, ~] = S12.cjsrQuadMultinorm() ;
% Producing figure 2
S2.viewMultinorm('quad', Qprimal2) ;
pauseCmd
S4.viewMultinorm('sos', Qprimal4) ;
pauseCmd
S6.viewMultinorm('sos', Qprimal6) ;
pauseCmd
S8.viewMultinorm('sos', Qprimal8) ;
pauseCmd
S10.viewMultinorm('sos', Qprimal10) ;
pauseCmd
S12.viewMultinorm('sos', Qprimal12) ;
pauseCmd

% The edge indices reprecent the following edges
%   (i, j, sigma)
% 1  1  3  1
% 2  1  2  3
% 3  2  1  2
% 4  2  3  1
% 5  3  1  2
% 6  3  2  3
% 7  3  4  4
% 8  3  3  1
% 9  4  3  1
% We can verify that Qdual2{i}, Qdual4{i}, Qdual6{i}, Qdual8{i},
% Qdual10{i} and Qdual12{i} are almost 0 for i = 3, 6, 7, 9
% and Qdual2{i}, Qdual4{i}, Qdual6{i}, Qdual8{i}
% are almost 0 for i = 2, 4.
% This is what is observed in Example 5.
% The final observation of Example 5 can be reproduced as follows:
[V1, L1] = eig(Qdual2{1})
pauseCmd
[V2, L2] = eig(Qdual2{5})
pauseCmd
[V3, L3] = eig(Qdual2{8})
pauseCmd

% You can reproduce results of Example 7 using cjsrBuildSequence
% and the dual variables computed earlier
% Algorithm 1 with 2d = 2
[lb, smp, seq, ~] = S2.cjsrBuildSequence(cjsrSettings(), Qdual2)
pauseCmd
% Algorithm 2 for l = 3 with 2d = 2
[lb, smp, seq, ~] = S2.cjsrBuildSequence(cjsrSettings('seq.l', 3), Qdual2)
pauseCmd
% We can check that it is an s.m.p. with cjsrCplxPolytopeMultinorm
[lb, smp, seq, ~] = S2.cjsrCplxPolytopeMultinorm(smp)
pauseCmd
% Algorithm 1 with 2d = 12 also finds the s.m.p.
[lb, smp, seq, ~] = S12.cjsrBuildSequence(cjsrSettings(), Qdual12)
pauseCmd
% Algorithm 1 with 2d = 10 does not find the s.m.p.
[lb, smp, seq, ~] = S10.cjsrBuildSequence(cjsrSettings(), Qdual10)
pauseCmd
% The performance of Algorithm 2 for l = 2 and 2d = 10 with a specific v_0 can be
% analyzed using the option seq.v0. For example, if we want the initial node to be 1:
[lb, smp, seq, ~] = S10.cjsrBuildSequence(cjsrSettings('seq.l', 2, 'seq.v_0', 1), Qdual10)
pauseCmd
% We can also try the primal solution as p_0
[lb, smp, seq, ~] = S10.cjsrBuildSequence(cjsrSettings('seq.l', 2, 'seq.v_0', 1, 'seq.p_0', Qprimal10{1}), Qdual10)
pauseCmd
T6  = S6.TProductLift(2) ;
[ubT6, QprimalT6,  QdualT6, ~]   =  T6.cjsrQuadMultinorm() ;
[lb, smp, seq, ~] = T6.cjsrBuildSequence(cjsrSettings(), QdualT6)
pauseCmd
M4  = S4.MDependantLift(2) ;
[ubM4, QprimalM4,  QdualM4, ~]   =  M4.cjsrQuadMultinorm() ;
[lb, smp, seq, ~] = M4.cjsrBuildSequence(cjsrSettings(), QdualM4)
