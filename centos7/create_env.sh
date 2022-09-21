
source /cvmfs/sft.cern.ch/lcg/releases/binutils/2.30-e5b21/x86_64-centos7/setup.sh

BASE=/cvmfs/sft.cern.ch/lcg/releases/gcc/8.3.0-cebb0/x86_64-centos7

export PATH=$BASE/bin:$PATH
export MANPATH=$BASE/share/man:$MANPATH

if [ -e "${BASE}/lib64" ]; then
    export LD_LIBRARY_PATH="$BASE/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi
if [ -e "${BASE}/lib" ]; then
    # Add lib if exists
    export LD_LIBRARY_PATH="$BASE/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi

# Export package specific environmental variables

gcc_home=/cvmfs/sft.cern.ch/lcg/releases/gcc/8.3.0-cebb0/x86_64-centos7 

export FC=`which gfortran`
export CC=`which gcc`
export CXX=`which g++`

export COMPILER_PATH=${gcc_home}


echo PATH=$PATH
echo MANPATH=$MANPATH
echo LD_LIBRARY_PATH=$LD_LIBRARY_PATH
echo FC=$FC
echo CC=$CC
echo CXX=$CXX
echo COMPILER_PATH=$COMPILER_PATH
