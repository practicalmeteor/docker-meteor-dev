# The practicalmeteor/meteor-dev docker image

## Building

```
./host/bin/docker-build.sh
```

* Upgrades the ubuntu distribution

* Installs dev related linux packages. See [here](https://github.com/practicalmeteor/docker-meteor-dev/blob/master/usr/local/bin/install-linux-packages.sh)

* Installs the node version meteor depends on globally. See [here](https://github.com/practicalmeteor/docker-meteor-dev/blob/master/usr/local/bin/install-node.sh)

* Installs dev related npm packages globally. See [here](https://github.com/practicalmeteor/docker-meteor-dev/blob/master/usr/local/bin/install-npm-packages.sh)

* Creates the meteor user, and gives it permissions for password-less sudo.

* Installs meteor for the meteor user.

## Running

```
./host/bin/docker-run.sh <repos-path> <METEOR_ENV>
```

* Mounts repos-path to repos under meteor's home directory.

* Adds 'export METEOR_ENV=...' to meteor's .bashrc

## Entering

```
./host/bin/docker-exec.sh
```

Will open a bash shell for the meteor user.

## License

[MIT](https://github.com/practicalmeteor/docker-meteor-dev/blob/master/LICENSE.txt)
