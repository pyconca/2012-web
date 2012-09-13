SHELL = /bin/bash

setup:
	pip install -r requirements.txt
	python setup.py develop
	./reset

test:
	python setup.py nosetests

clean:
	find . -name \*.pyc -delete
