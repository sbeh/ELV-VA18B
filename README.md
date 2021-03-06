# ELV-VA18B
Linux Data Acquisition Tool and Optocoupler Driver for the ELV VA18B Multimeter

## Origin
This software was found at http://multimeter.schewe.com/ and patched to work with the VA18B Multimeter from ELV.

## Introduction

This is a litte data acquisition tool for the V&A VA18B multimeter connected to a Linux PC via the provided USB optocoupler.
While the first version of this software also contained a hardware driver for the USB optocoupler, this is not needed anymore. Recent kernels should come with a driver called "spcp8x5" that gives you a TTY device as soon as the link is connected to your USB host. From version 0.2 on this software is based on that kernel driver and does not contain the old driver anymore. If you need the deprecated driver, please use version 0.1.

To get the initialization of the SPCP825 based optocoupler working, I had to sniff and analyse the communication of the 'Sunplus RS232C to USB Adapter' Windows driver. If you put your multimeter in the PC-LINK mode, you can read out the binary state of the LCD cells via the optical port. The transcoding to a human readable output format is done by the provided data acquisition tool called 'multimeter'. It is a simple Perl script that reads the encoded data from a given TTY device (defaults to /dev/ttyUSB0) and writes tab seperated values of the measured data to stdout.

## Compatibility

So far the software has only been tested with a V&A VA18B on Linux, but chances are that some other mutlimeters (e.g. PeakTech 3375) and Unixes will be compatible as well.

## Installation

You do not need to, but you might want to install the tool system-wide:

`$ sudo make install`

## Usage

Connect your multimeter to the PC and just run 'multimeter' without any argument. As soon as you put the multimeter in the PC-LINK mode, the data acquisition tool will start to dump the measured values along some other data:

| column | data |
|-------:|:-----|
| 1st    | passed seconds since the acquisition has started |
| 2nd    | measured value |
| 3rd    | unit: \[u\|k\|m\|M\] (%\|Ohm\|A\|V\|Hz\|C) |
| 4th    | flags: AC, DC, auto, diode_test, cont_check, rel, hold, min, max |

To stop the acquisition press Control-C. To write the data to a file, you have to redirect stdout accordingly.

If you want to connect several multimeters to your PC in parallel, you have to call the tool with an argument that gives the full path to the corresponding TTY device.

Note: you can leave your multimeter in the PC-LINK mode, while running 'multimeter' several times.

## Example
`$ multimeter > test.dat`

And if you want to log the data of two multimeters in two different files at the same time:

`$ multimeter > test1.dat & multimeter /dev/ttyUSB1 > test2.dat`
