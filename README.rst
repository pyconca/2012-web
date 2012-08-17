===================
``pyconca`` Website
===================

Getting Started
---------------

.. parsed-literal::

    ~$ **virtualenv -p python2.7 env-pyconca**
    ~$ **source env-pyconca/bin/activate**
    (env-pyconca)~$ **cd workspace/pyconca/**
    (env-pyconca)~/workspace/pyconca$ **python setup.py develop**
    Finished processing dependencies for pyconca==0.0
    (env-pyconca)~/workspace/pyconca$ **./reset**
    (env-pyconca)~/workspace/pyconca$ **./run**
    serving on http://0.0.0.0:6543

If you are more comfortable with Makefiles you can do the following

.. parsed-literal::

    ~$ **virtualenv -p python2.7 env-pyconca**
    ~$ **source env-pyconca/bin/activate**
    (env-pyconca)~$ **cd workspace/pyconca/**
    (env-pyconca)~/workspace/pyconca$ **make setup**
    (env-pyconca)~/workspace/pyconca$ **./run**
    serving on http://0.0.0.0:6543

Testing
-------

If you are so inlcined to help test here is a quick way to get started running the tests

.. parsed-literal::

    (env-pyconca)~$ **cd workspace/pyconca/**
    (env-pyconca)~/workspace/pyconca$ **make test**
    test_index_logged_in_admin (pyconca.tests.test_talk_api.TestTalkApi) ... ok
    test_index_logged_in_speaker (pyconca.tests.test_talk_api.TestTalkApi) ... ok
    test_index_not_logged_in (pyconca.tests.test_talk_api.TestTalkApi) ... ok
    test_index_logged_in_admin (pyconca.tests.test_index.TestIndexFunctional) ... ok
    test_index_logged_in_speaker (pyconca.tests.test_index.TestIndexFunctional) ... ok
    test_index_not_logged_in (pyconca.tests.test_index.TestIndexFunctional) ... ok

    ----------------------------------------------------------------------
    Ran 6 tests in 0.080s

