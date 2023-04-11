#!/bin/sh

if [ $# -ne 1 ] ; then
    echo "it shoul provied arg package path(ex: \$test.sh infra-digital-certificate)"
    exit
fi
TPATH=$1

MDLIST=$(find ./${TPATH} -name '*.md')

if which md2po2md >/dev/null; then
    echo "mdpo installed"
else
	echo "It needs install mdpo. please run script below :"
    echo "pip install mdpo"
    exit
fi


for v in $MDLIST;
do
    P=${v:2}
    IFS="/" read -a arr <<< "$P"
    len=${#arr[@]}

    FPATH="${arr[@]/*.md}"
    FPATH=${FPATH//" "/"/"}
    PATH=(${arr[@]/*.md})
    PATH="${PATH[@]:1}"
    PATH=${PATH//" "/"/"}
    NAME=${arr[len-1]}
    /opt/homebrew/bin/md2po2md -l en -o "${TPATH}_{lang}/${PATH}" --po-wrapwidth 0 --md-wrapwidth 0 "${FPATH}*.md"
    # /opt/homebrew/bin/md2po2md -l en --po-wrapwidth inf --mdwrapwidth inf -o "infra-digital-certificate_{lang}/get-started/setting" "infra-digital-certificate/get-started/setting/*.md"
done 

echo cp -r ./${TPATH}/.gitbook ./${TPATH}_en/.gitbook
cp -r ./${TPATH}/.gitbook ./${TPATH}_en/.gitbook