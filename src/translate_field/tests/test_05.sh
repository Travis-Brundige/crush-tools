test_number=05
description="preserve header line"

infile="$test_dir/test.in"
expected="$test_dir/test_$test_number.expected"

subtest=1
outfile="$test_dir/test_$test_number.$subtest.actual"
$bin -k -f 1 -x "s/[0-9]//g" "$test_dir/test.in" > "$outfile"
if [ $? -ne 0 ] ||
   [ "`diff -q $outfile $expected`" ]; then
  test_status $test_number $subtest "$description (index)" FAIL
else
  test_status $test_number $subtest "$description (index)" PASS
  rm "$outfile"
fi

subtest=2
outfile="$test_dir/test_$test_number.$subtest.actual"
$bin -k -F Field-0 -x "s/[0-9]//g" "$test_dir/test.in" > "$outfile"
if [ $? -ne 0 ] ||
   [ "`diff -q $outfile $expected`" ]; then
  test_status $test_number $subtest "$description (label)" FAIL
else
  test_status $test_number $subtest "$description (label)" PASS
  rm "$outfile"
fi
