%% |ncreads.m|: Read multiple variables from a netCDF file
% Author: Kelly Kearney
%
% *Note:* The functions in this package (|ncreads| and |ncreadsseries|)
% have now been merged into a single function (|ncstruct|) which has been
% folded into the <https://github.com/chadagreene/CDT Climate Data
% Toolbox>. I will retain this repository for back-compatibility purposes,
% but am no longer updating the code here, and recommend users move to the
% newer CDT code (which also offers a number of companion utilities to
% assist in reading and writing netCDF data in Matlab).
%
% This repository includes the code for the |ncreads.m| and
% |ncreadsseries.m| Matlab functions, along with all dependent functions
% required to run them.  
%
% The |ncreads| function offers the ability to read multiple variables from
% a netCDF file.  It provides a wrapper around the native |ncread|
% function, with the additional benefit of allowing consistent subsetting
% along one or more dimensions for all variables read.
%
% NetCDF files often hold very large datasets.  In order to keep file sizes
% somewhat manageable, it's common practice in ocean science (and probably
% other fields as well) to break datasets into several files along a
% record (unlimited) dimension.  The |ncreadsseries| function is identical
% to the |ncreads| function except that it reads data from one of these
% series of files.  In addition to eliminating the need to loop over files
% to read in  data, this function figures out which variables include the
% record dimension, and eliminates repeated reading of those variables that
% do not span multiple files. 
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
%  Data = ncreadsseries(files, ...)
%
% Input variables:
%
% * |file|: name of netCDF file (string or character array)
% * |files|: names of netCDF files (cell array of strings or character
%   arrays)
% * |Scs|: structure whose fieldnames match a dimension in the file, each
%   of which holds a 1 x 3 start-count-stride vector.
% * |var#|: name of a variable in the file to be read in
%
% See function header for full description of input and output variables.

%% Example: Reading variables from a single file
%
% We can read in all the variables from the example.nc file:

A = ncreads('example.nc')

%%
% The Scs structure input can be used to read in a subset of the variables.
% You specify how to subset each dimension, and any read-in variable that
% includes that dimension will be subset accordingly.  

% For x dimension, read in every 5th element, starting from the second,

Scs = struct('x', [2 Inf 5]);  

B = ncreads('example.nc', Scs)


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


