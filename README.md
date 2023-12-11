About tudat-feedstock
=====================

Feedstock license: [BSD-3-Clause](https://github.com/tudat-team/tudat-feedstock/blob/main/LICENSE.txt)

Home: http://tudat.tudelft.nl/

Package license: BSD

Summary: A C++ platform to perform astrodynamics and space research.

Current build status
====================


<table>
    
  <tr>
    <td>Azure</td>
    <td>
      <details>
        <summary>
          <a href="https://dev.azure.com/tudat-team/feedstock-builds/_build/latest?definitionId=2&branchName=main">
            <img src="https://dev.azure.com/tudat-team/feedstock-builds/_apis/build/status/tudat-feedstock?branchName=main">
          </a>
        </summary>
        <table>
          <thead><tr><th>Variant</th><th>Status</th></tr></thead>
          <tbody><tr>
              <td>linux_64</td>
              <td>
                <a href="https://dev.azure.com/tudat-team/feedstock-builds/_build/latest?definitionId=2&branchName=main">
                  <img src="https://dev.azure.com/tudat-team/feedstock-builds/_apis/build/status/tudat-feedstock?branchName=main&jobName=linux&configuration=linux%20linux_64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_64</td>
              <td>
                <a href="https://dev.azure.com/tudat-team/feedstock-builds/_build/latest?definitionId=2&branchName=main">
                  <img src="https://dev.azure.com/tudat-team/feedstock-builds/_apis/build/status/tudat-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>osx_arm64</td>
              <td>
                <a href="https://dev.azure.com/tudat-team/feedstock-builds/_build/latest?definitionId=2&branchName=main">
                  <img src="https://dev.azure.com/tudat-team/feedstock-builds/_apis/build/status/tudat-feedstock?branchName=main&jobName=osx&configuration=osx%20osx_arm64_" alt="variant">
                </a>
              </td>
            </tr><tr>
              <td>win_64</td>
              <td>
                <a href="https://dev.azure.com/tudat-team/feedstock-builds/_build/latest?definitionId=2&branchName=main">
                  <img src="https://dev.azure.com/tudat-team/feedstock-builds/_apis/build/status/tudat-feedstock?branchName=main&jobName=win&configuration=win%20win_64_" alt="variant">
                </a>
              </td>
            </tr>
          </tbody>
        </table>
      </details>
    </td>
  </tr>
</table>

Current release info
====================

| Name | Downloads | Version | Platforms |
| --- | --- | --- | --- |
| [![Conda Recipe](https://img.shields.io/badge/recipe-tudat-green.svg)](https://anaconda.org/tudat-team/tudat) | [![Conda Downloads](https://img.shields.io/conda/dn/tudat-team/tudat.svg)](https://anaconda.org/tudat-team/tudat) | [![Conda Version](https://img.shields.io/conda/vn/tudat-team/tudat.svg)](https://anaconda.org/tudat-team/tudat) | [![Conda Platforms](https://img.shields.io/conda/pn/tudat-team/tudat.svg)](https://anaconda.org/tudat-team/tudat) |

Installing tudat
================

Installing `tudat` from the `tudat-team/label/dev` channel can be achieved by adding `tudat-team/label/dev` to your channels with:

```
conda config --add channels tudat-team/label/dev
conda config --set channel_priority strict
```

Once the `tudat-team/label/dev` channel has been enabled, `tudat` can be installed with `conda`:

```
conda install tudat
```

or with `mamba`:

```
mamba install tudat
```

It is possible to list all of the versions of `tudat` available on your platform with `conda`:

```
conda search tudat --channel tudat-team/label/dev
```

or with `mamba`:

```
mamba search tudat --channel tudat-team/label/dev
```

Alternatively, `mamba repoquery` may provide more information:

```
# Search all versions available on your platform:
mamba repoquery search tudat --channel tudat-team/label/dev

# List packages depending on `tudat`:
mamba repoquery whoneeds tudat --channel tudat-team/label/dev

# List dependencies of `tudat`:
mamba repoquery depends tudat --channel tudat-team/label/dev
```




Updating tudat-feedstock
========================

If you would like to improve the tudat recipe or build a new
package version, please fork this repository and submit a PR. Upon submission,
your changes will be run on the appropriate platforms to give the reviewer an
opportunity to confirm that the changes result in a successful build. Once
merged, the recipe will be re-built and uploaded automatically to the
`tudat-team` channel, whereupon the built conda packages will be available for
everybody to install and use from the `tudat-team` channel.
Note that all branches in the tudat-team/tudat-feedstock are
immediately built and any created packages are uploaded, so PRs should be based
on branches in forks and branches in the main repository should only be used to
build distinct package versions.

In order to produce a uniquely identifiable distribution:
 * If the version of a package **is not** being increased, please add or increase
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string).
 * If the version of a package **is** being increased, please remember to return
   the [``build/number``](https://docs.conda.io/projects/conda-build/en/latest/resources/define-metadata.html#build-number-and-string)
   back to 0.

Feedstock Maintainers
=====================

* [@DominicDirkx](https://github.com/DominicDirkx/)
* [@ggarrett13](https://github.com/ggarrett13/)

