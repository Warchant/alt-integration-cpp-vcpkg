# alt-integration-cpp-vcpkg

How to use:

1. Install vcpkg first.
2. Add repo as submodule. Important: name 
```
# then add this repo as submodule
$ cd vcpkg/ports

# dir name should be 'altintegration'
$ git submodule add --name altintegration https://github.com/Warchant/alt-integration-cpp-vcpkg altintegration
```

2. Use vcpkg:
```
$ vcpkg install altintegration
```
