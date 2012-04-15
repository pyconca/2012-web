pyconca README
==================

Getting Started
---------------

diana@ubuntu:~$ virtualenv env-pyconca

diana@ubuntu:~$ source env-pyconca/bin/activate

(env-pyconca)diana@ubuntu:~$ cd workspace/pyconca/

(env-pyconca)diana@ubuntu:~/workspace/pyconca$ python setup.py develop
Finished processing dependencies for pyconca==0.0

(env-pyconca)diana@ubuntu:~/workspace/pyconca$ python setup.py test
----------------------------------------------------------------------
Ran 1 test in 0.016s

OK

(env-pyconca)diana@ubuntu:~/workspace/pyconca$ initialize_pyconca_db development.ini

(env-pyconca)diana@ubuntu:~/workspace/pyconca$ pserve development.ini --reload
serving on http://0.0.0.0:6543
