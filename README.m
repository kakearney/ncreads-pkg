%% |ncreads.m|: Read multiple variables from a netCDF file
% Author: Kelly Kearney
%
% This repository includes the code for the |ncreads.m| Matlab function,
% along with all dependent functions required to run it. 
%
% This function provides a wrapper around the |ncread.m| function, allowing
% multiple variables to be read in at once.
%
%% Getting started
%
% *Prerequisites*
%
% This function requires Matlab R2011a or later.
%
% *Downloading and installation*
%
% This code can be downloaded from <https://github.com/kakearney/ncreads-pkg/ Github>. 
%
% *Matlab Search Path*
%
% The following folders need to be added to your Matlab Search path (via
% |addpath|, |pathtool|, etc.):
%
%   ncreads-pkg/ncreads

%% Syntax
%
%  Data = ncreads(file, var1, var2, ...)
%  Data = ncreads(file, Scs, var1, var2, ...)
%
% Input variables:
%
% * |file|: name of netCDF file  
% * |Scs|: structure whose fieldnames match a dimension in the file, each
%   of which holds a 1 x 3 start-count-stride vector.
% * |var#|: name of a variable in the file to be read in
%
% See function header for full description of input and output variables.

%% Examples
%
% We can read in all the variables from the example.nc file:

A = ncreads('example.nc')

%%
% The Scs structure input can be used to read in a subset of the variables.
% You specify how to subset each dimension, and any read-in variable that
% inlcudes that dimension will be subset accordingly.  

% For x dimension, read in every 5th element, starting from the second,

Scs = struct('x', [2 Inf 5]);  

B = ncreads('example.nc', Scs, 'temperature', 'peaks')

%% Contributions
%
% Community contributions to this package are welcome!
% 
% To report bugs, please submit
% <https://github.com/kakearney/ncreads-pkg/issues an issue> on GitHub and
% include:  
% 
% * your operating system
% * your version of Matlab and all relevant toolboxes (type |ver| at the Matlab command line to get this info)  
% * code/data to reproduce the error or buggy behavior, and the full text of any error messages received 
% 
% Please also feel free to submit enhancement requests, or to send pull
% requests (via GitHub) for bug fixes or new features. 
% 
% I do monitor the MatlabCentral FileExchange entry for any issues raised
% in the comments, but would prefer to track issues on GitHub. 


