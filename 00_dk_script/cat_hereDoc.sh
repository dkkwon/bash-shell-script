#!/bin/sh

foo="--foo text--"
cat <<_EOF_
$foo
"$foo"
'$foo'
/$foo
_EOF_
echo

cat <<_EOF_
	$foo
	"$foo"
	'$foo'
	/$foo
_EOF_
echo

# to ignore tap
cat <<-_EOF_
	$foo
	"$foo"
	'$foo'
	/$foo
_EOF_
