from nose.tools import eq_

from pyconca.util import *


def test_camel_to_under_single_name():
    eq_('foo', camel_to_under('Foo'))


def test_camel_to_under_double_name():
    eq_('foo_bar', camel_to_under('FooBar'))


def test_camel_to_under_triple_name():
    eq_('foo_bar_baz', camel_to_under('FooBarBaz'))


def test_under_to_camel_single_name():
    eq_('Foo', under_to_camel('foo'))


def test_under_to_camel_double_name():
    eq_('FooBar', under_to_camel('foo_bar'))


def test_under_to_camel_triple_name():
    eq_('FooBarBaz', under_to_camel('foo_bar_baz'))
