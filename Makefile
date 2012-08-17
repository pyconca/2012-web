SHELL = /bin/bash

setup:
		 python setup.py develop
		 ./reset

test:
		 python setup.py test
