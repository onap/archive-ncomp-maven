#!/bin/bash

DIR=$1
GGGG=$2
AAAA=$3
PORT=$4

BBBB=`echo $AAAA | sed s/$NCOMPNAME-//g`
CCCC=`echo $AAAA | sed 's/.*-//g'`

SDIR=git/$GGGG/$AAAA/src/main/server/config

## for V in RDIR AAAA PORT BBBB CCCC SDIR; do echo $V=$(eval echo \$$V); done

if [ -e $DIR ]; then echo Directory exists: $DIR; exit; fi
mkdir -p $DIR

if [ -e $SDIR ]; then
  cp -rp $SDIR $DIR/config
fi

if [ -e $DIR/config/pw.sh.sh ]; then
  bash $DIR/config/pw.sh.sh > $DIR/config/pw.sh
  chmod +x $DIR/config/pw.sh
  rm $DIR/config/pw.sh.sh
fi

if [ -e $DIR/config ]; then
  for V in AAAA PORT BBBB
  do
    find $DIR/config -type f  | xargs -I X sed -i s/$V/$(eval echo \$$V)/g X
  done
fi

if [ -e $DIR/config/pw.sh ]; then
  find $DIR/config -type f \! -name pw.sh | xargs -I X echo "cat X | $DIR/config/pw.sh > X.bak; mv X.bak X" | bash
fi

if [ -e $DIR/config/makefile ]; then
  mv $DIR/config/makefile $DIR/makefile
fi



