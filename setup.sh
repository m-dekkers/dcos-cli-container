#!/usr/bin/env sh
# Copyright (c) 2019 Martijn Dekkers, D2iQ.
# Licensed under the Apache 2.0 License
# Martijn Dekkers <mdekkers@d2iq.com>

source functions.sh

starttext(){
printhdr "DCOS CLI Catalina 32Bit Workaround"
echo ""
echo "This script will create an alias \"tmpdcos\" that will run the dcos cli"
echo "from a linux container to work around an issue introduced by OSX Catalina"
echo "no longer supporting 32bit applications"
echo "It will create a folder \"\.tmpdcos\" to hold the dcos configuration."
echo "You will need to run \"mydcos cluster setup\" to configure this workaround"
echo "for your cluster(s)"
echo "Please keep using the regular dcos CLI whenever possible and only use tmpdcos"
echo "to be able to keep working when you hit a 32bit issue. When you do, please raise"
echo "the issue in #dcos-cluster-ops on D2iQ Slack or through your regular support channel"
printhdr "This tool is not official D2iQ software, and has seen almost no testing."
printhdr "Usage may cause random and unexpected calamities."
printhdr "This tool is a temporary workaround. Don't rely on this tool for anything."
echo ""
}

getshell(){

echo "If you are using Bash, Fish, Tcsh, Zsh, or Ksh, this script will insert the alias"
echo "in your shell startup script(s). If you are using some other shell, please add"
echo "the alias yourself."
echo ""
}

setalias(){

if [[ ! -d ~/.tmpdcos ]]; then
	mkdir ~/.tmpdcos
fi

THECMD="alias tmpdcos='docker run -it --rm -e HOME=${HOME} -v ~/.tmpdcos:${HOME}/.dcos -v $PWD:/dcos --workdir /dcos mesosphere/dcos-cli-container:latest'"

DOTFILES=("${HOME}/.bash_profile" "${HOME}/.profile" "${HOME}/.config/fish/functions" "${HOME}/.zshrc" "${HOME}/.login")

for i in "${DOTFILES[@]}"; do
	if [[ -f "$i" ]]; then
		echo "Found $i"
		echo "alias tmpdcos='docker run -it --rm -e HOME=\${HOME} -v ~/.tmpdcos:\${HOME}/.dcos -v \$PWD:/dcos --workdir /dcos mesosphere/dcos-cli-container:latest'" >> ${i}
		echo "Execute \"source $i\" to make the new alias available immediately"
	fi
done

echo "If your shell was not detected by this script, please add"
echo ""
echo "alias tmpdcos='docker run -it --rm -e HOME=\${HOME} -v ~/.tmpdcos:\${HOME}/.dcos -v \$PWD:/dcos --workdir /dcos mesosphere/dcos-cli-container:latest'"
echo ""
echo "to your shell startup script"

}


starttext
getshell
setalias

