import os

from setuptools import setup, find_packages

here = os.path.abspath(os.path.dirname(__file__))
README = open(os.path.join(here, 'README.rst')).read()
CHANGES = open(os.path.join(here, 'CHANGES.txt')).read()

requires = [
#    'MySQL-python',
    'FormEncode',
    'mock',
    'pyramid',
    'SQLAlchemy',
    'transaction',
    'py-bcrypt',
    'pyramid_tm',
    'pyramid_debugtoolbar',
    'pytz',
    'zope.sqlalchemy',
    'waitress',
    'webtest',
    'nose',
    ]

setup(name='pyconca',
      version='0.0',
      description='pyconca',
      long_description=README + '\n\n' +  CHANGES,
      classifiers=[
        "Programming Language :: Python",
        "Framework :: Pylons",
        "Topic :: Internet :: WWW/HTTP",
        "Topic :: Internet :: WWW/HTTP :: WSGI :: Application",
        ],
      author='',
      author_email='',
      url='',
      keywords='web wsgi bfg pylons pyramid',
      packages=find_packages(),
      include_package_data=True,
      zip_safe=False,
      test_suite='nose.collector',
      tests_require=[
      ],
      install_requires=requires,
      entry_points="""\
      [paste.app_factory]
      main = pyconca:main
      [console_scripts]
      initialize_pyconca_db = pyconca.scripts.initializedb:main
      pyconca_create_tables = pyconca.scripts.create_tables:main
      """,
      )

