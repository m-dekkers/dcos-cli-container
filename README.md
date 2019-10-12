# dcos-cli-container
Linux (debian) container with the dcos cli tool, because OSX Catalina broke the MKE CLI.

Set up an alias of some sort:

```alias mydcos='docker run -it --rm -e HOME=${HOME} -v ~/.dcos:${HOME}/.dcos -v $PWD:/dcos --workdir /dcos d2iqmdekkers/dcos-cli-container:1.2'```

You can replace `alias mydcos=[...]` with whatever you like, for example `alias dcos=[...]` if you are brave.

## Issues:
- You will have to remove and reinstall / setup existing clusters.
- The progress bars don't show, and when setting up a cluster or installing a package it appears that the command hangs. Use ```-v``` or ```-vv``` for output. 
- If you set `alias` to `dcos`, command completion works, ...slowly...

I hope we have an updated set of tools for OSX Catalina soon. In the meantime, this should work. 

Any issues or bugs, please mail or slack me. 

