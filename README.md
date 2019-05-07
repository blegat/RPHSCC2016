This directory contains code to recreate the examples from

> Benoît Legat and Raphaël M. Jungers and Pablo A. Parrilo,
> "Generating unstable trajectories for Switched Systems via Dual
> Sum-Of-Squares techniques" in Hybrid Systems Computational &
> Control, ACM (2016).

The result of this paper were obtained using the [CSSystem toolbox](https://bitbucket.org/lcambier/cjsr/) in Matlab.
The same example is used in the journal version of this work but the results
of this journal version were obtained using the [SwitchOnSafety](https://github.com/blegat/SwitchOnSafety.jl) toolbox in [Julia](https://julialang.org/).
You can find below the details on how to reproduce the results of this example in either Julia or Matlab.

## Julia

The code to reproduce the results is in [this notebook](https://github.com/blegat/SwitchOnSafety.jl/blob/master/examples/LPJ17.ipynb).
To run the notebook you can either

* run it on the cloud with [juliabox.com](https://juliabox.com/), this does not install anything on your computer;
* or [install Julia](https://julialang.org/downloads/), [install IJulia](https://github.com/JuliaLang/IJulia.jl) and then [run the notebook with IJulia](https://github.com/JuliaLang/IJulia.jl).

## Matlab

It requires the CSSystem Toolbox, which can be downloaded from [here](https://bitbucket.org/lcambier/cjsr/get/hscc16rp.zip).

*Note: This download the version tested for the repeatibility evaluation.
You can also try a more recent version if you feel like it.*

Follow the Readme of the CSSystem toolbox to make sure
you have an SDP solver installed and recognized by CSSystem.

After CSSystem is installed, you must modify `addPathToCSSystem.m` in
this directory so that `path_to_cjsr` points to the root directory
of your CSSystem installation.

Then run

    > addPathToCSystem

If you are getting an error later about "missing functions" later
then you haven't correctly modified `addPathToCSSystem`.

Run the script reproduce.m to reproduce the results of the paper.

    > reproduce

Read the comments in `reproduce.m` to understand what it does.

Alternatively, you can run the CSSystem demo `gettingStarted4` that explains
the use of the function `cjsrBuildSequence`.
This function implements the method of the paper and the demo
uses the same example than the paper.

    > gettingStarted4

Questions and bug reports (and any examples of the use of this
technique on other problems) can be sent to `benoit.legat at gmail dot com` or
directly here on Github or the Bitbucket repository of CSSystem.

Benoît Legat, Raphaël M. Jungers and Pablo A. Parrilo
January 2015
