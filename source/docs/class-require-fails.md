---
layout: post
title: Requiring a class file fails
category: Build troubleshooting
---

If Ruby's `require` fails on Semaphore, but passes on your local machine, you
should check if all files are named and required correctly. Case insensitive
file systems, like (NTFS and HFS) tolerate case differences in a file's name and path.

For example, naming a class file `Foo.rb` and requiring with `requre 'foo'`
might work on a machine with NTFS file system, but will fail on Semaphore,
because code is executed on a machine that runs Ubuntu with case sensitive
file system.
