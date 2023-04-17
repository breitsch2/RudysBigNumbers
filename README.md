# Rudy's Big Numbers <a href="https://github.com/TurboPack/RudysBigNumbers/"><img src="https://user-images.githubusercontent.com/821930/230476405-ebf33117-139a-4895-8d00-70e30186e3fa.jpg" align="Right" alt="Logo for Rudy's Big Numbers Library"></a>

[Rudy Velthuis](http://rvelthuis.de) is the orignal author of this library. He unfortunately passed away a while back. In an effort to keep this valuable library alive we've done the following:

* Pulled changes from [all the other branches](https://github.com/TurboPack/RudysBigNumbers/network) into this repository
* Created [Wiki articles](https://github.com/TurboPack/RudysBigNumbers/wiki) based on his original documentation (with some updates)
* Opened up for [issues](https://github.com/TurboPack/RudysBigNumbers/issues) 
* Fixed some other issues and updated for Delphi 11.3

***Pull requests welcome.*** If you want to help maintain this library, please let us know.

![1207_bigeuler_bigpi2](https://user-images.githubusercontent.com/109789632/232424638-63c3a169-b3ac-432c-90f6-013503bf1195.png)
BigPI and BigEuler in maXbox4

----

## BigInteger, BigDecimal and BigRational for Delphi and C++Builder

These are implementations of the multi-precision `BigInteger`, `BigDecimal` and `BigRational` types, built from scratch by Rudy Velthuis and now maintained by [TurboPack](https://github.com/TurboPack).

## BigInteger

`BigInteger` is a multi-precision integer. Its size is only limited by available memory.

`BigInteger` is built for ease of use, speed and reliability. It is written in plain Object Pascal and x86-32/x86-64 assembler, but every assembler function has a so called "pure Pascal" equivalent as well. It is modelled after the `BigInteger` type in .NET, but is far more optimized than that and provides an interface that is more in line with Delphi. It uses higher level algorithms like *Burnikel-Ziegler*, *Karatsuba*, *Toom-Cook*, etc. to make things fast even for very large integers. It offers overloaded operators and all the usual functions. More information can be found on the [BigIntegers unit](https://github.com/TurboPack/RudysBigNumbers/wiki/BigIntegers) wiki page.

## BigDecimal

`BigDecimal` is a multi-precision decimal floating point type. It can have an almost unlimited precision.

`BigDecimal` is equally built for ease of use and reliability. It builds on top of BigInteger: the internal representation is a BigInteger for the significant digits, and a scale to indicate the decimals. It also offers overloaded operators and all the usual functions. This is modelled after the `BigDecimal` type in Java, but the interface is more in line with Delphi. More information about this type can be found on the [BigDecimals unit](https://github.com/TurboPack/RudysBigNumbers/wiki/BigDecimals) wiki page.

## BigRational

A type that holds a number as fraction (ratio) of two `BigIntegers`, a numerator and a denominator, i.e. `1/7` or `100/3`. 
This type is very good at simple arithmetic (`+`, `-`, `*`, `/`), since it doesn't lose precision or need any rounding. Still a work in progress...

## C++Builder

The newest version of BigIntegers has additional overloaded operators and additional constructors that are compatible
with C++Builder. So now you simply include:

    #include "Velthuis.BigIntegers.hpp"

and then you can do things like:

    BigInteger a = 17;
    BigInteger b = "123";
    BigInteger c = a + b;

## Directory structure

```
RudysBigNumbers
   Source                      --- Sources for units and for bases.inc
   Tests
      BigDecimals /...         --- Sources for DUnit tests for BigDecimals
      BigIntegers /...         --- Sources for DUnit tests for BigIntegers
      BigRationals /...        --- Sources for DUnit tests for BigRationals
   Visualizers                 --- Sources for IDE debug visualizer DLL and packages for BigInteger and BigDecimal  
   Samples                     --- A Few samples of Big Math including Pi and Euler's number
```

The [data generators](https://github.com/TurboPack/RudysBigNumbers-DataGenerators/) are now in their own repository.
