----
-- Tests for the xlsxwriter.lua Worksheet class.
--
-- Copyright 2014, John McNamara, jmcnamara@cpan.org
--

require 'Test.More'

plan(8)

----
-- Tests setup.
--
local expected
local got
local caption
local Worksheet = require 'xlsxwriter.worksheet'
local worksheet
local format = 1 -- TODO. Add format when available.

----
-- 1. Test the _write_row() method.
--
caption  = " \tWorksheet: _write_row()"
expected = '<row r="1">'

worksheet = Worksheet:new()
worksheet:_set_filehandle(io.tmpfile())

worksheet:_write_row(0)

got = worksheet:_get_data()

is(got, expected, caption)

----
-- 2. Test the _write_row() method.
--
caption  = " \tWorksheet: _write_row()"
expected = '<row r="3" spans="2:2">'

worksheet = Worksheet:new()
worksheet:_set_filehandle(io.tmpfile())

worksheet:_write_row(2, '2:2')

got = worksheet:_get_data()

is(got, expected, caption)

----
-- 3. Test the _write_row() method.
--
caption  = " \tWorksheet: _write_row()"
expected = '<row r="2" ht="30" customHeight="1">'

worksheet = Worksheet:new()
worksheet:_set_filehandle(io.tmpfile())

worksheet:_write_row(1, undef, 30)

got = worksheet:_get_data()

is(got, expected, caption)

----
-- 4. Test the _write_row() method.
--
caption  = " \tWorksheet: _write_row()"
expected = '<row r="4" hidden="1">'

worksheet = Worksheet:new()
worksheet:_set_filehandle(io.tmpfile())

worksheet:_write_row(3, undef, undef, undef, 1)

got = worksheet:_get_data()

is(got, expected, caption)

----
-- 5. Test the _write_row() method.
--
caption  = " \tWorksheet: _write_row()"
expected = '<row r="7" s="1" customFormat="1">'

worksheet = Worksheet:new()
worksheet:_set_filehandle(io.tmpfile())

worksheet:_write_row(6, undef, undef, format)

got = worksheet:_get_data()

is(got, expected, caption)

----
-- 6. Test the _write_row() method.
--
caption  = " \tWorksheet: _write_row()"
expected = '<row r="10" ht="3" customHeight="1">'

worksheet = Worksheet:new()
worksheet:_set_filehandle(io.tmpfile())

worksheet:_write_row(9, undef, 3)

got = worksheet:_get_data()

is(got, expected, caption)

----
-- 7. Test the _write_row() method.
--
caption  = " \tWorksheet: _write_row()"
expected = '<row r="13" ht="24" hidden="1" customHeight="1">'

worksheet = Worksheet:new()
worksheet:_set_filehandle(io.tmpfile())

worksheet:_write_row(12, undef, 24, undef, 1)

got = worksheet:_get_data()

is(got, expected, caption)

----
-- 8. Test the _write_empty_row() method.
--
caption  = " \tWorksheet: _write_empty_row()"
expected = '<row r="13" ht="24" hidden="1" customHeight="1"/>'

worksheet = Worksheet:new()
worksheet:_set_filehandle(io.tmpfile())

worksheet:_write_empty_row(12, undef, 24, undef, 1)

got = worksheet:_get_data()

is(got, expected, caption)
