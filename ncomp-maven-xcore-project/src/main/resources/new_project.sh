#!/bin/bash

RDIR=$1
PPPP=$2
## QQQQ=$3
ZZZZ=$3
AAAA=$4
GNAMEEEE=$5
NCOMPBASE=$6
NCOMPNAME=$7

RRRR=`echo $PPPP | sed s/-//g`
SSSS=`echo $PPPP | sed s/-/./g`
XXXX=`echo $PPPP | sed sx-x/xg`
##TTTT=`echo $QQQQ | sed s/-/./g`
##YYYY=`echo $QQQQ | sed sx-x/xg`
BBBB=$(tr '[:upper:]' '[:lower:]' <<< $ZZZZ)

## for x in PPPP RRRR SSSS ZZZZ AAAA GNAMEEEE BBBB XXXX NCOMPBASE NCOMPNAME; do echo $x $(eval echo \$$x); done

SDIR=$(dirname $0)/archetype-resources

DIR=$RDIR

## echo cp -rp $SDIR $DIR
cp -rp $SDIR $DIR

find $DIR -type f  | xargs -I X54xx sed -i s/PPPP/$PPPP/g X54xx
## find $DIR -type f  | xargs -I X54xx sed -i s/QQQQ/$QQQQ/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/RRRR/$RRRR/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/SSSS/$SSSS/g X54xx
##find $DIR -type f  | xargs -I X54xx sed -i s/TTTT/$TTTT/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/ZZZZ/$ZZZZ/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/AAAA/$AAAA/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/BBBB/$BBBB/g X54xx
find $DIR -type f  | xargs -I YY sed -i s/GNAMEEEE/$GNAMEEEE/g YY
find $DIR -type f  | xargs -I YY sed -i s/NCOMPBASE/$NCOMPBASE/g YY
find $DIR -type f  | xargs -I YY sed -i s/NCOMPNAME/$NCOMPNAME/g YY

for file in $(find $DIR -name \*:\*); do
  type=$(echo $file | sed sx.*/xx | sed 's/:.*//')
  file1=$(echo $file | sed 's/.*://')
  ## echo $file $type $file1
  dir=$(dirname $file)
  if [ "$BBBB" == "$type" ]; then 
    mv $file $dir/$file1
  else
    rm $file 
  fi
done
