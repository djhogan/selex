primer5=CATCAT
primer3=TAGTAG

actual=`cd ..; bash pipeline.sh "${primer5}" "${primer3}" <test/test.fastq`
expected="\
ATGCATGCATGCATGCATGC
GCATGCATGCATGCATGCAT"

if [ "${actual}" = "${expected}" ]
then
  echo "PASS"
else
  echo "FAIL"
  echo "actual:"
  echo "${actual}"
  echo "expected:"
  echo "${expected}"
fi

