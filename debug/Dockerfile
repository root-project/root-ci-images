
FROM registry.cern.ch/root-ci/fedora37:buildready

# "unminimize" fedora image
RUN dnf install -y @"Minimal Install"  \
 && dnf clean all                      \
 && rm -rf /var/cache/dnf

# Install latest vim with relevant features
RUN git clone https://github.com/vim/vim.git --depth 1 -b master --single-branch \
 && cd vim                  \
 && ./configure --enable-python3interp=yes --prefix=/usr/local --with-features=huge --disable-gui \
 && make                    \
 && make install            \
 && cd ..                   \
 && rm -rf ./vim

# Punish emacs users
RUN ln $(which vim) /usr/bin/emacs

# Add Andre Sailer's git config
COPY sailer-gitconfig /root/.gitconfig


# emacs takes an absurd amount of time to compile, when installing from
# dnf it has to be called with `-nw` every time to open in terminal.
# Additionally the dnf package increases the image size by 500MB

#RUN git clone https://github.com/emacs-mirror/emacs.git --depth 1 -b master --single-branch \
# && cd emacs                \
# && ./autogen.sh            \
# && ./configure --without-x \
# && make                    \
# && make install            \
# && cd ..                   \
# && rm -rf ./emacs

