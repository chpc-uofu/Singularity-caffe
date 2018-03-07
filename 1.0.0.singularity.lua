-- -*- lua -*-
-- Written by MC on 3/6/2018
help(
[[
Caffe 1.0.0 container running Ubuntu 18.04.
Defines the following commands:
 - "caffe" - Caffe executable
 - "python3" - iner which includes Caffe and all its depenencies

]])

load("singularity")
local CPATH="/uufs/chpc.utah.edu/sys/installdir/caffe/1.0.0-singularity"

-- singularity environment variables to bind the paths and set shell
setenv("SINGULARITY_BINDPATH","/scratch,/uufs/chpc.utah.edu")
setenv("SINGULARITY_SHELL","/bin/bash")
-- shell function to provide "alias" to the seqlink commands, as plain aliases don't get exported to bash non-interactive shells by default
set_shell_function("python3",'singularity run --nv ' .. CPATH .. '/ubuntu_caffe_gpu.simg "$@"',"singularity run --nv " .. CPATH .. "/ubuntu_caffe_gpu.simg $*")
set_shell_function("caffe",'singularity exec --nv ' .. CPATH .. '/ubuntu_caffe_gpu.simg caffe "$@"',"singularity exec --nv " .. CPATH .. "/ubuntu_caffe_gpu.simg caffe $*")
-- to export the shell function to a subshell
if (myShellName() == "bash") then
 execute{cmd="export -f python3",modeA={"load"}}
 execute{cmd="export -f caffe",modeA={"load"}}
end

whatis("Name        : Caffe")
whatis("Version     : 1.0.0")
whatis("Category    : Deep learning framework")
whatis("URL         : http://http://caffe.berkeleyvision.org")
