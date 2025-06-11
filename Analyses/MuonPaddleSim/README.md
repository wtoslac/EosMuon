# Eos Simulations

Eos simulations using rat-pac.

## Installation

Hard Dependencies (other versions may work, below lists tested versions):

- ROOT v6.28
- Geant4 v11.1.2
- HDF5 1.14.4.3
- HighFive v2.9.0

Optional dependencies:

- Cry
- Tensorflow
- nlopt

For all dependency details, refer to `setup.sh` in
[ratpac-setup](https://github.com/rat-pac/ratpac-setup). You can also just
clone the repo, and run

```sh
./setup.sh --only chroma root geant4 cry hdf5
```

Feel free to add more packages as needed, above lists what is installed by
default in for CI tests (so "guaranteed" to work)

To build, run `make`.

## Containers

To make a Eos singularity container, ensure you have a machine that have git
setup correctly to clone this repo.

Create a file `EosSimulations.def`, with the following content:

``` text

Bootstrap: docker
From: ratpac/ratpac-two:main

%setup
  git clone https://github.com/EosDemonstrator/EosSimulations.git ${APPTAINER_ROOTFS}/EosSimulations

%post -c /bin/bash
  source /ratpac-setup/env.sh
  cd /EosSimulations
  cmake . -Bbuild -DCMAKE_INSTALL_PREFIX=$(pwd)/install
  cmake --build build -- -j$(nproc)
  cmake --install build

%environment
  source /EosSimulations/eos.sh
```

To build, run `apptainer run eos.sif path/to/EosSimulations.def`  If you don't
have ssh keys setup for github, you may need to type in  your username/token
during the build.

## Running

```sh
eos <macro.mac> <rat options>
```

With the container, you can also do

```sh
apptainer run eos.sif <macro.mac>
```

Or, to enter the container and poke around,

```sh
apptainer run eos.sif 
# In container 
eos <macro.mac> <rat options>
```
