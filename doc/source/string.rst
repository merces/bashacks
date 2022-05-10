String
=======

In this section, you are see funcions for string manipulate.


bh_asc2dec
----------

This function performs the conversion of a char on it's decimal equivalent.

.. note::

    ``bh_asc2dec`` [char] 

.. code-block:: bash 
    
    $  bh_asc2dec a 
    97
    $ bh_asc2dec A 
    65


bh_asciitable
-------------

Display in the terminal ascii table, if you are a programmer knows how this's important.

.. note:: 

    ``bh_asciitable``

.. code-block:: bash 

    $ bh_asciitable 

    Dec Hex    Dec Hex    Dec Hex  Dec Hex  Dec Hex  Dec Hex   Dec Hex   Dec Hex
      0 00 NUL  16 10 DLE  32 20    48 30 0  64 40 @  80 50 P   96 60 `  112 70 p
      1 01 SOH  17 11 DC1  33 21 !  49 31 1  65 41 A  81 51 Q   97 61 a  113 71 q
      2 02 STX  18 12 DC2  34 22 "  50 32 2  66 42 B  82 52 R   98 62 b  114 72 r
      3 03 ETX  19 13 DC3  35 23 #  51 33 3  67 43 C  83 53 S   99 63 c  115 73 s
      4 04 EOT  20 14 DC4  36 24 $  52 34 4  68 44 D  84 54 T  100 64 d  116 74 t
      5 05 ENQ  21 15 NAK  37 25 %  53 35 5  69 45 E  85 55 U  101 65 e  117 75 u
      6 06 ACK  22 16 SYN  38 26 &  54 36 6  70 46 F  86 56 V  102 66 f  118 76 v
      7 07 BEL  23 17 ETB  39 27 '  55 37 7  71 47 G  87 57 W  103 67 g  119 77 w
      8 08 BS   24 18 CAN  40 28 (  56 38 8  72 48 H  88 58 X  104 68 h  120 78 x
      9 09 HT   25 19 EM   41 29 )  57 39 9  73 49 I  89 59 Y  105 69 i  121 79 y
     10 0A LF   26 1A SUB  42 2A *  58 3A :  74 4A J  90 5A Z  106 6A j  122 7A z
     11 0B VT   27 1B ESC  43 2B +  59 3B ;  75 4B K  91 5B [  107 6B k  123 7B {
     12 0C FF   28 1C FS   44 2C ,  60 3C <  76 4C L  92 5C \  108 6C l  124 7C |
     13 0D CR   29 1D GS   45 2D -  61 3D =  77 4D M  93 5D ]  109 6D m  125 7D }
     14 0E SO   30 1E RS   46 2E .  62 3E >  78 4E N  94 5E ^  110 6E n  126 7E ~
     15 0F SI   31 1F US   47 2F /  63 3F ?  79 4F O  95 5F _  111 6F o  127 7F DEL



bh_dec2asc
----------

Once having to enter a decimal returns it's equivalent in ascii.

.. note:: 
    
    ``bh_dec2asc`` [decimal]

    decimal :  dec equivalent of the ascii table to convert

.. code-block:: bash 

    $ bh_dec2asc 65 
    A 
    $ bh_dec2asc 41 
    )



bh_hex2str
----------

Converts one or more bytes into a hex string to str. 

Accepts as input all output formats str2hex function.

.. note::
    
    ``bh_hex2str`` [hex string]
   
 
.. code-block:: bash

    $ bh_hex2str '72 6f 63 6b'
    rock
    $ bh_hex2str '0x726f636b'
    rock
    $ bh_hex2str '0x72 0x6f 0x63 0x6b'
    rock
    $ bh_hex2str '{0x72, 0x6f, 0x63, 0x6b}'
    rock


    
bh_str2dec
----------

Convert one or more bytes to their decimal equivalent.


.. note::
    
    ``bh_str2dec`` [char or string]
   
 
.. code-block:: bash

    $ bh_str2dec A
    65
    $ bh_str2dec mbin
    109 98 105 110
    $ bh_str2dec root
    114 111 111 116



bh_str2hexr
-----------

Converts string in hex byte equivalent to each char (hex string). reverse mode

.. note::

    ``bh_str2hexr`` [-x] [-0x] [-c] [string]

.. code-block:: bash

     $ bh_str2hexr 'Fernando'
     6f 64 6e 61 6e 72 65 46
     $ bh_str2hexr -x 'Fernando'
     \x6f\x64\x6e\x61\x6e\x72\x65\x46
     $ bh_str2hexr -0x 'Fernado'
     0x6f 0x64 0x6e 0x61 0x6e 0x72 0x65 0x46


bh_str2hex
----------

Converts string in hex byte equivalent to each char (hex string).

.. note::

    ``bh_str2hex`` [-x] [-0x] [-c] [string]

.. code-block:: bash

    $ bh_str2hex 'Fernando'
    46 65 72 6e 61 6e 64 6f
    $ bh_str2hex -x 'Fernando'
    \x46\x65\x72\x6e\x61\x6e\x64\x6f
    $ bh_str2hex -0x 'Fernado'
    0x46 0x65 0x72 0x6e 0x61 0x6e 0x64 0x6f


bh_urldecode
------------

Decode string with bh_urldecode from web standard to human format.

.. note:: 
    
    ``bh_urldecode``  [encoded string]

.. code-block:: bash

    $ bh_urldecode '%2fzzz%21%40%2e%23'
    /zzz!@.#


bh_urlencode
------------

Encoded string with bh_urlencode to web standard.

.. note:: 
    
    ``bh_urlencode``  [string]

.. code-block:: bash

    $ bh_urlencode '/zzz!@.#'
    %2fzzz%21%40%2e%23


bh_utf8table
------------

Show UTF8 table.

.. note::
    
    ``bh_utf8table``

.. code-block:: bash

    $ bh_utf8table
    Hex      Hex      Hex      Hex      Hex      Hex      Hex      Hex
    c2 a0    c2 ac ¬  c2 b8 ¸  c3 84 Ä  c3 90 Ð  c3 9c Ü  c3 a8 è  c3 b4 ô
    c2 a1 ¡  c2 ad    c2 b9 ¹  c3 85 Å  c3 91 Ñ  c3 9d Ý  c3 a9 é  c3 b5 õ
    c2 a2 ¢  c2 ae ®  c2 ba º  c3 86 Æ  c3 92 Ò  c3 9e Þ  c3 aa ê  c3 b6 ö
    c2 a3 £  c2 af ¯  c2 bb »  c3 87 Ç  c3 93 Ó  c3 9f ß  c3 ab ë  c3 b7 ÷
    c2 a4 ¤  c2 b0 °  c2 bc ¼  c3 88 È  c3 94 Ô  c3 a0 à  c3 ac ì  c3 b8 ø
    c2 a5 ¥  c2 b1 ±  c2 bd ½  c3 89 É  c3 95 Õ  c3 a1 á  c3 ad í  c3 b9 ù
    c2 a6 ¦  c2 b2 ²  c2 be ¾  c3 8a Ê  c3 96 Ö  c3 a2 â  c3 ae î  c3 ba ú
    c2 a7 §  c2 b3 ³  c2 bf ¿  c3 8b Ë  c3 97 ×  c3 a3 ã  c3 af ï  c3 bb û
    c2 a8 ¨  c2 b4 ´  c3 80 À  c3 8c Ì  c3 98 Ø  c3 a4 ä  c3 b0 ð  c3 bc ü
    c2 a9 ©  c2 b5 µ  c3 81 Á  c3 8d Í  c3 99 Ù  c3 a5 å  c3 b1 ñ  c3 bd ý
    c2 aa ª  c2 b6 ¶  c3 82 Â  c3 8e Î  c3 9a Ú  c3 a6 æ  c3 b2 ò  c3 be þ
    c2 ab «  c2 b7 ·  c3 83 Ã  c3 8f Ï  c3 9b Û  c3 a7 ç  c3 b3 ó  c3 bf ÿ


