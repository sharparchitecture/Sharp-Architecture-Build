*Note:* Sharp-Architecture-Build is not under development anymore. Sharp-Architecture uses [Cake Build](https://cakebuild.net/) now. 

Sharp Architecture Build
------------------------------

Common build system for the Sharp Architecture project.

SA repositories reference the build project as a Git submodule. Custom scripts are written that reference and invoke the main builld system, hooking into the extensibility points to build and package the correct project/files.

For an example on how to use this build, please refer to the readme in SampleBuild directory.

Build system requires following chocolatey packages to be installed before build

* nuget.commandline
* resharper-clt.portable
* nunit.portable
* opencover.portable
* reportgenerator.portable

