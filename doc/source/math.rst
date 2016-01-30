Math
====

In this section, we will varios funcions of mathematics operations that helps us in everyday life.

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



bh_dec2bin
----------

Opossed to ``bh_bin2dec`` this function expects a decimal for converting it into binary.


.. note:: 

    Usage

    ``bh_dec2bin`` [decimal]

    decimal :  string in decimal format.


.. code-block:: bash

    $ bh_dec2bin 255
    11111111

    $ bh_dec2bin 2
    10

    $ bh_dec2bin 14
    1110


.. code-block:: bash

    #Example 

    $ for dec in {1..6} ;
    > do
    >    echo "$dec = $(bh_dec2bin $dec)" ;
    > done 

    1 = 1
    2 = 10
    3 = 11
    4 = 100
    5 = 101
    6 = 110



bh_dec2hex
----------

bh_hex2bin
----------

bh_hex2dec
----------

bh_hexcalc
----------

bh_pow
------

bh_shl
------

bh_shr
------

bh_xor
------
