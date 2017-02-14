#!/bin/bash

RDIR=$1
PPPP=$2
QQQQ=$3
ZZZZ=$4
AAAA=$5
PREFIXXXX=$6
GNAMEEEE=$7
MODELPROJECTNAME=$8
NCOMPBASE=$9
NCOMPNAME=${10}

RRRR=`echo $PPPP | sed s/-//g`
SSSS=`echo $PPPP | sed s/-/./g`
XXXX=`echo $PPPP | sed sx-x/xg`
TTTT=`echo $QQQQ | sed s/-/./g`
YYYY=`echo $QQQQ | sed sx-x/xg`

SDIR=$(dirname $0)/archetype-resources

DIR=$RDIR

cp -rp $SDIR $DIR

find $DIR -type f  | xargs -I X54xx sed -i s/PPPP/$PPPP/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/QQQQ/$QQQQ/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/RRRR/$RRRR/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/SSSS/$SSSS/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/TTTT/$TTTT/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/ZZZZ/$ZZZZ/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/AAAA/$AAAA/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/PREFIXXXX/$PREFIXXXX/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/GNAMEEEE/$GNAMEEEE/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/MODELPROJECTNAME/$MODELPROJECTNAME/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/NCOMPBASE/$NCOMPBASE/g X54xx
find $DIR -type f  | xargs -I X54xx sed -i s/NCOMPNAME/$NCOMPNAME/g X54xx

##for x in PPPP QQQQ RRRR SSSS TTTT ZZZZ AAAA PREFIXXXX GNAMEEEE MODELPROJECTNAME NCOMPBASE NCOMPNAME; do echo $x $(eval echo \$$x); done

mkdir -p $DIR/config
mkdir -p $DIR/src/main/server
mkdir -p $DIR/src/main/server-gen
mkdir -p $DIR/src/main/sirius-gen
TOOLDIR=$DIR/src/main/java/$(echo $NCOMPBASE | sed sx\\.x/xg)/$XXXX/$YYYY/tools

##echo TOOLDIR=$TOOLDIR

mkdir -p $TOOLDIR
mv $DIR/TOOLS/* $TOOLDIR/
rm -r $DIR/TOOLS

mv $DIR/src/main/server/config/SERVER.properties $DIR/src/main/server/config/$TTTT.properties

for file in $(find $DIR -name \*:\*); do
  type=$(echo $file | sed sx.*/xx | sed 's/:.*//')
  file1=$(echo $file | sed 's/.*://')
  ##echo $file $type $file1
  dir=$(dirname $file)
  if [ "$ZZZZ" == "$type" ]; then 
    mv $file $dir/$file1
  else
    rm $file 
  fi
done
