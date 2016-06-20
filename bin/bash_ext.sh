# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# qiao ++
alias tree='tree --charset ASCII'
alias htags='htags -aFghInosxv --show-position --tabs 4'
alias rsync='rsync -rRvul --no-implied-dirs --times'
alias grep='grep --color -rns --exclude-dir=".svn" --exclude-dir=".git"'

# qiao@2015.12.15 
# FIXME: how to source anther file?
#if [ -f /opt/ros/indigo/setup.bash ]; then
#    source /opt/ros/indigo/setup.bash
#fi
export PATH=$PATH:/home/qiao/Android/Sdk/platform-tools
export PATH=$PATH:/home/qiao/Android/Sdk/ndk-bundle
export PATH=$PATH:/home/qiao/Tools/scripts
export PATH=$PATH:/home/qiao/Tools/android-studio/bin
export LIBGL_ALWAYS_SOFTWARE=1
