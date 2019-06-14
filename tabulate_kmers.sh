#!/usr/bin/env bash

usage(){
  echo "Usage: $0 [-d DIR] FILE1 FILE2" 1>&2
  exit 1
}

DIR="."

while getopts "d:" o; do
  case "$o" in
    d)
      DIR=$OPTARG
      ;;
    *)
      usage
      ;;
  esac
done
shift $((OPTIND-1))

if [ ! -d "$DIR" ]
then
  echo "Directory $DIR does not exist"
  exit 1
fi

if [ "$#" -ne 2 ]
then
  usage
fi

if [ ! -f "$1" ]
then
  echo "File $1 does not exist"
  exit 1
fi

if [ ! -f "$2" ]
then
  echo "File $2 does not exist"
  exit 1
fi

FILE1=$1
FILE2=$2

for i in `seq 5 15`
do
  echo $i started
  join -o auto -e 0 -a 1 -a 2 \
    <(perl count_kmers.pl $i <"$FILE1" | sort) \
    <(perl count_kmers.pl $i <"$FILE2" | sort) \
    | perl add_freq_column.pl \
    >"${DIR}/${i}"
  echo $i finished
done

