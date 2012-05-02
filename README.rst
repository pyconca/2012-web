===================
``pyconca`` Website
===================

Getting Started
---------------
::

    ~$ virtualenv env-pyconca
    ~$ source env-pyconca/bin/activate
    (env-pyconca)~$ cd workspace/pyconca/
    (env-pyconca)~/workspace/pyconca$ python setup.py develop
    Finished processing dependencies for pyconca==0.0
    (env-pyconca)~/workspace/pyconca$ initialize_pyconca_db development.ini
    (env-pyconca)~/workspace/pyconca$ ./run
    serving on http://0.0.0.0:6543
