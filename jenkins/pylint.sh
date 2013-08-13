rm -f pylint.log
for f in `find . -name '*.py'|egrep -v '^./tests/|^./build/'`; do
pylint --output-format=parseable --disable=W0311,W0403,W0232,E1101 --generated-members=objects,content,status_code --reports=y $f >> pylint.log
done || :