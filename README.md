# DCOS CLI Catalina 32Bit Workaround"

Linux (debian) container with the dcos cli tool, because OSX Catalina broke the MKE CLI.

This script will create an alias `tmpdcos` that will run the dcos cli from a linux container to work around an issue introduced by OSX Catalina no longer supporting 32bit applications

It will create a folder `.tmpdcos` to hold the dcos configuration.

You will need to run `tmpdcos cluster setup` to configure this workaround for your cluster(s). 

Please keep using the regular dcos CLI whenever possible and only use tmpdcos to be able to keep working when you hit a 32bit issue. When you do, please raise the issue in `#dcos-cluster-ops` on D2iQ Slack or through your regular support channel.

This tool is not official D2iQ software, and has seen almost no testing.
Usage may cause random and unexpected calamities.
This tool is a temporary workaround. Don't rely on this tool for anything.


## To do this manually

Set up an alias of some sort:

```alias tmpdcos='docker run -it --rm -e HOME=${HOME} -v ~/.tmpdcos:${HOME}/.dcos -v $PWD:/dcos --workdir /dcos mesosphere/dcos-cli-container:latest'```

You can replace `alias tmpdcos=[...]` with whatever you like, for example `alias dcos=[...]` but I'd advise you keep using the regular `dcos` command, and only use this workaround when you encounter a subcommand that doesn't work. 

If you find another subcommand that doesn't work, please reach out to #dcos-cluster-ops if you are @D2iQ or open a support ticket. 

## Issues:
- You will have to remove and reinstall / setup existing clusters.
- The progress bars don't show, and when setting up a cluster or installing a package it appears that the command hangs. Use ```-v``` or ```-vv``` for output. 
- If you set `alias` to `dcos`, command completion works, ...slowly...

I hope we have an updated set of tools for OSX Catalina soon. In the meantime, this should work. 

Any issues or bugs, please mail or slack me. 

