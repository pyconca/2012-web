SHELL = /bin/bash

setup:
	python setup.py develop
	./reset

test:
	python setup.py nosetests

clean:
	find . -name \*.pyc -delete
