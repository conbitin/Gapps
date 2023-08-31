#!/bin/bash

MYABSPATH=$(readlink -f "$0")
PATCHBASE=$(dirname "$MYABSPATH")
CMBASE=$(readlink -f "$PATCHBASE/../../../")
echo $CMBASE
echo $PATCHBASE
for i in $(find "$PATCHBASE"/* -type d); do
    PATCHNAME=$(basename "$i")
    PATCHTARGET=$PATCHNAME
    for j in $(seq 4); do
        PATCHTARGET=$(echo $PATCHTARGET | sed 's/_/\//')
        if [ -d "$CMBASE/$PATCHTARGET" ]; then break; fi
    done

    echo applying $PATCHNAME to $PATCHTARGET
    cd "$CMBASE/$PATCHTARGET" 2>/dev/null || { echo $PATCHTARGET not found && continue; }

    suffix=".patch"
    
    if compgen -G "$PATCHBASE/$PATCHNAME/*${suffix}" > /dev/null; then
        git apply "$PATCHBASE/$PATCHNAME"/*${suffix}
    fi
done