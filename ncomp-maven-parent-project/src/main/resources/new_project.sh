#!/bin/bash

GIT=$1
PREFIX=$2
GNAMEEEE=$3

RRRR=`echo $PPPP | sed s/-//g`
SSSS=`echo $PPPP | sed s/-/./g`
XXXX=`echo $PPPP | sed sx-x/xg`
##TTTT=`echo $QQQQ | sed s/-/./g`
##YYYY=`echo $QQQQ | sed sx-x/xg`
BBBB=$(tr '[:upper:]' '[:lower:]' <<< $ZZZZ)

SDIR=$(dirname $0)/archetype-resources

DIR=$GIT/$PREFIX


if [ -e $DIR ]; then 
  echo $DIR exists
  exit 1
fi

echo Creating Maven Parent project $DIR

cp -rp $SDIR $DIR

find $DIR -type f  | xargs -I X sed -i s/PPPP/$PREFIX/g X
find $DIR -type f  | xargs -I YY sed -i s/GNAMEEEE/$GNAMEEEE/g YY

for d1 in $(ls -1d $GIT/$PREFIX-*); do
  d=$(basename $d1)
  ## echo DIR $d
  ## echo sed -i "s=MMMM=<module>../$d</module>\nMMMM=" $DIR/pom.xml
  sed -i "s=MMMM=<module>../$d</module>\n    MMMM=" $DIR/pom.xml
done
sed -i "s/.*MMMM.*//" $DIR/pom.xml


