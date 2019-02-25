# SortingAlgorithmsSwift

Implementation of the most popular sorting algorithms as swift extensions for the Array data type.

## Requirements
- [Swift 4.2.2 or above](https://swift.org/download/)


## Installing

Below is a quick tutorial on how to install swift on Linux machines, for Mac OS simply install Xcode.

1. Download the bundle containing all swift tools and the language core 
```sh
$ wget https://swift.org/builds/swift-4.2.2-release/ubuntu1804/swift-4.2.2-RELEASE/swift-4.2.2-RELEASE-ubuntu18.04.tar.gz
```
2. Extract and add the arquive to a shared path on your device
```sh
$ tar xzf swift-4.2.2-RELEASE-ubuntu18.04.tar.gz
$ sudo mv swift-4.2.2-RELEASE-ubuntu18.04 /usr/share/swift
```
3. Export the source path on yout system
```sh
$ echo "export PATH=/usr/share/swift/usr/bin:$PATH" >> ~/.bashrc
$ source ~/.bashrc
```
4. Check if it is installed
```sh
$ swift --version
```

## Compiling

Compile the source invoking the swift build on the terminal
```sh
$ swift build
```

## Executing

Execute the application by calling swift run with the appropriate parameters
```sh
$ swift run SortingAlgorithmsSwift ./instances/num.1000.1.in S
```
Where the above will execute selection sort S for the input ./instances/num.1000.1.in

Once concluded the elapsed time will be presented on the terminal and a file named num.1000.1.ALGORITH.out will be written along with the input.

## Contributors

* Caio Marcelo Campoy Guedes <caiomcg@gmail.com>