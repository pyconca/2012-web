SHELL = /bin/bash

setup:
	pip install -r requirements.txt
	python setup.py develop
	./reset

test:
	python setup.py nosetests

clean:
	find . -name \*.pyc -delete

localization_catalog:
	python setup.py extract_messages
	python setup.py update_catalog

compile_catalog:
	python setup.py compile_catalog
