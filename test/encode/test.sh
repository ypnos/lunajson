#!/bin/sh
source ../luabin.sh

echo "# valid"
for l in *-encoder.lua; do
	echo "## $l"
	for d in validdata/*.lua; do
		echo "### ${d}"
		echo "#### lua51"
		eval "${lua51}" test.lua valid "${l}" "${d}" 2>&1
		echo "#### lua52"
		eval "${lua52}" test.lua valid "${l}" "${d}" 2>&1
		echo "#### lua53"
		eval "${lua53}" test.lua valid "${l}" "${d}" 2>&1
		echo "#### luajit"
		eval "${luajit}" test.lua valid "${l}" "${d}" 2>&1
	done
done

echo "# invalid"
for l in *-encoder.lua; do
	echo "## $l"
	for d in invaliddata/*.lua; do
		echo "### ${d}"
		echo "#### lua51"
		eval "${lua51}" test.lua invalid "${l}" "${d}" 2>&1
		echo "#### lua52"
		eval "${lua52}" test.lua invalid "${l}" "${d}" 2>&1
		echo "#### lua53"
		eval "${lua53}" test.lua invalid "${l}" "${d}" 2>&1
		echo "#### luajit"
		eval "${luajit}" test.lua invalid "${l}" "${d}" 2>&1
	done
done

echo "# bench"
for l in *-encoder.lua; do
	echo "## $l"
	for d in benchdata/*.lua; do
		echo "### ${d}"
		echo "#### lua51"
		eval "${lua51}" test.lua bench "${l}" "${d}" 2>&1
		echo "#### lua52"
		eval "${lua52}" test.lua bench "${l}" "${d}" 2>&1
		echo "#### lua53"
		eval "${lua53}" test.lua bench "${l}" "${d}" 2>&1
		echo "#### luajit"
		eval "${luajit}" test.lua bench "${l}" "${d}" 2>&1
	done
done
