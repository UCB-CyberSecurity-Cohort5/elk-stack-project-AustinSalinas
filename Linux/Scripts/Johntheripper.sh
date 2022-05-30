#!/bin/bash

WORDLIST='/usr/share/wordlist/rockyou.txt'
HASH=$1
echo $HASH > crack.tmp
john crack.tmp -w $WORDLIST --show
rm crack.tmp
