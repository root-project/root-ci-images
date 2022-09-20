
# Source this script on centos7 before building ROOT

# alternatively one could use cmake=$(which cmake3) and run cmake with $cmake
cmake(){
	cmake3 "$@"
}
echo -f cmake



# Setup binutils
BINUTILS_BASE=/cvmfs/sft.cern.ch/lcg/releases/binutils/2.30-e5b21/x86_64-centos7

echo PATH=$BINUTILS_BASE/bin:$PATH
echo MANPATH=$BINUTILS_BASE/share/man:$MANPATH

if [ -e "${BINUTILS_BASE}/lib64" ]; then
    echo LD_LIBRARY_PATH="$BINUTILS_BASE/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi
if [ -e "${BINUTILS_BASE}/lib" ]; then
    # Add lib if exists
    echo LD_LIBRARY_PATH="$BINUTILS_BASE/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi




# Setup gcc

GCC_BASE=/cvmfs/sft.cern.ch/lcg/releases/gcc/8.3.0-cebb0/x86_64-centos7

echo PATH=$GCC_BASE/bin:$PATH
echo MANPATH=$GCC_BASE/share/man:$MANPATH

if [ -e "${GCC_BASE}/lib64" ]; then
    echo LD_LIBRARY_PATH="$GCC_BASE/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi
if [ -e "${GCC_BASE}/lib" ]; then
    # Add lib if exists
    echo LD_LIBRARY_PATH="$GCC_BASE/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi

gcc_home=/cvmfs/sft.cern.ch/lcg/releases/gcc/8.3.0-cebb0/x86_64-centos7 

echo FC=`which gfortran`
echo CC=`which gcc`
echo CXX=`which g++`

echo COMPILER_PATH=${gcc_home}


