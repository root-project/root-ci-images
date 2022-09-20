
# Run this script inside centos7 to print
# the environment needed to compile ROOT to stdout


if [ -e "${BINUTILS_BASE}/lib64" ]; then
     LD_LIBRARY_PATH="$BINUTILS_BASE/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi
if [ -e "${BINUTILS_BASE}/lib" ]; then
    # Add lib if exists
     LD_LIBRARY_PATH="$BINUTILS_BASE/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi


BINUTILS_BASE=/cvmfs/sft.cern.ch/lcg/releases/binutils/2.30-e5b21/x86_64-centos7
GCC_BASE=/cvmfs/sft.cern.ch/lcg/releases/gcc/8.3.0-cebb0/x86_64-centos7


if [ -e "${GCC_BASE}/lib64" ]; then
     LD_LIBRARY_PATH="$GCC_BASE/lib64${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi
if [ -e "${GCC_BASE}/lib" ]; then
    # Add lib if exists
     LD_LIBRARY_PATH="$GCC_BASE/lib${LD_LIBRARY_PATH:+:$LD_LIBRARY_PATH}"
fi

gcc_home=/cvmfs/sft.cern.ch/lcg/releases/gcc/8.3.0-cebb0/x86_64-centos7 

FC=`which gfortran`
CC=`which gcc`
CXX=`which g++`
COMPILER_PATH=${gcc_home}

MANPATH=$BINUTILS_BASE/share/man:$GCC_BASE/share/man
PATH=$BINUTILS_BASE/bin:$GCC_BASE/bin

echo "PATH=\$PATH:$PATH"
echo "MANPATH=$MANPATH"
echo "LD_LIBRARY_PATH=$LD_LIBRARY_PATH"
echo "FC=$FC"
echo "CC=$CC"
echo "CXX=$CXX"
echo "COMPILER_PATH=$COMPILER_PATH"

