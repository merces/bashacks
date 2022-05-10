Math
====

In this section, we will have many funcions of mathematics operations that help us in everyday life.

They are not complex to assemble in bash, however, nothing better than a small function to assist, nothing better that send data and get or return result, always read the code.


bh_bin2dec
----------

This function expects a binary and return its equivalent in decimal.

.. note::
    
    Usage

    ``bh_bin2dec`` [binary]

    binary   :   string in binary format.


.. code-block:: bash

    $ bh_bin2dec 11111111
    255

    $ bh_bin2dec 10
    2

    $ bh_bin2dec 1110
    14


bh_charcalc
-----------

Think of a way to make operations with 'char', how to sum two positions for a 'char/string' and return letter c or sum of the other and multiply it by 10 and returns 10 

.. note::
    
    Usage

    ``bh_charcalc`` [char/string] [operator] [number]

    char/string   :   string or char to operation 
    operator :  \* + -
    number :  num of operation


.. code-block:: bash

    $ bh_charcalc A + 2
    C

    $ bh_charcalc A \* 255
    AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA.......


bh_dec2bin
----------

Opossed to ``bh_bin2dec`` this function expects a decimal for converting it into binary.


.. note:: 

    Usage

    ``bh_dec2bin`` [decimal]

    decimal :  number in decimal format.


.. code-block:: bash

    $ bh_dec2bin 255
    11111111

    $ bh_dec2bin 2
    10

    $ bh_dec2bin 14
    1110

    #Example 

    $ for dec in {1..6};
     do
        echo "$dec = $(bh_dec2bin $dec)";
     done 

    1 = 1
    2 = 10
    3 = 11
    4 = 100
    5 = 101
    6 = 110


bh_dec2hex
----------

The function expects a input a decimal number it performs the conversion to hex.

.. note:: 

    Usage

    ``bh_dec2hex`` [decimal]

    decimal: number in decimal format


.. code-block:: bash

    $ bh_dec2hex 10
    a

    $ bh_dec2hex 255
    ff


bh_hex2bin
----------

Capture all submitted arguments and convert to binary

.. note:: 

    Usage

    ``bh_hex2bin`` [list or one hex digit]


.. code-block:: bash

    $ bh_hex2bin abcdef 1 2 3
    101010111100110111101111 1 10 11

    $ bh_hex2bin 10
    10000


bh_hex2dec
----------

This's a conversion function from hex digit to decimal digit

.. note:: 

    Usage

    ``bh_hex2dec`` [one or more hex digit]


.. code-block:: bash

    $ bh_hex2dec A
    10

    $ bh_hex2dec FF
    255


bh_hexcalc
----------

In the same way as ``bh_charcalc``, however, work here with hexdigit.

.. note:: 

    Usage

    ``bh_hex2cal`` [hex digit] [operator] [hex digit]


.. code-block:: bash

    $ bh_hex2dec A \* 2
    0xa0

    $ bh_hex2bin FF + 1
    0x100

