# dcos-cli-container
i386 container with the dcos cli tool, because Catalina broke MKE CLI

Set up an alias of some sort:

```alias mydcos='docker container run -it --rm -v ~/.dcos:/root/.dcos --workdir /root d2iqmdekkers/dcos-cli-container:386-1.0'```

If required, replace mydcos with whatever you like. When used as above, this will use your existing .dcos config (already installed plugines, clusters etc)

