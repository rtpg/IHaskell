#!/bin/sh
# Called from Setup.hs.

# Preprocess the GHC parser we're using to CPP subs.
cpphs --linepragma --text HaskellParser.y.pp -OParser.y

# Compile the parser and remove intermediate file.
happy Parser.y
rm Parser.y

# Move output Haskell to source directory.
mkdir -p Language/Haskell/GHC
mv Parser.hs Language/Haskell/GHC/HappyParser.hs
