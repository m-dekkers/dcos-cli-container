# dcos-cli-container
Linux (debian) container with the dcos cli tool, because OSX Catalina broke the MKE CLI.

Set up an alias of some sort:

```docker run -it --rm -e HOME=${HOME} -v ~/.dcos:${HOME}/.dcos -v $PWD:/dcos --workdir /dcos d2iqmdekkers/dcos-cli-container:1.2'```

You can replace mydcos with whatever you like, for example ```dcos``` if you are brave.

## Issues:
- You will have to remove and reinstall / setup existing clusters.
- The progress bars don't show, and when setting up a cluster or installing a package it appears that the command hangs. use ```-v``` or ```-vv``` for output. 

I hope we have an updated set of tools for OSX Catalina soon. In the meantime, this should work. 

Any issues or bugs, please mail or slack me. 

