Crypto
=======

In this page, you will found information from all functions of cryptograpy on the bashacks


bh_hashcrack
------------

This is our old function ``bh_unmd5`` with many improvements, now can with several hashes, just update the name.

In this new version we cache the hash that have already been found, improving delivery speed.

.. note:: Usage 

    ``bh_hascrack`` [hash string] 


    Supported hash string for decryption:

    ``md5``, ``sha1``, ``sha256``, ``sha384``, ``sha512``


.. code-block:: bash
    
    #md5
    $ bh_hashcrack e10adc3949ba59abbe56e057f20f883e
    123456
    
    #sha1
    $ bh_hashcrack 38464bf083d958b53580c63c01e56707fd043588
    rock
    
    #sha256
    $ bh_hashcrack 9ca0f72f324a7bd2c2efc64b40d1e769a473451c2b9e5dfbd54a9db53c986ba5 
    mamonas
    
    #sha384
    $ bh_hashcrack 504f008c8fcf8b2ed5dfcde752fc5464ab8ba064215d9c514785180d2ad7cee1ab792ad44798c
    1234

    #sha512
    $ bh_hashcrack 5b01e57fd8ab53cc7c0d2a97585ba5a9d70f0dc966472b32736c52a4823f3fb43532dfc1e83fd2d92f1a7dbec8c401f4d7355b67accec
    hack

This function has given a lot of work, many upgrades, have a good time that we have to find a good source hashed base.


bh_rot
------

Encrypts/Decrypts string with the Cesar Cipher using n shifts to the right.

.. note:: Usage
    
    ``bh_rot`` [int] [string]

    int : Aumount of jumps you want to give to the right

    string : string to code or decode


.. code-block:: bash

    $ bh_rot 3 terra
    whuud
    $ bh_rot 13 terra
    green


.. sidebar:: Facilities

    We created some facilities, aliases for multiple entries of ``rot`` function, see below.
    
    .. code-block:: bash

        $ bh_rot13 terra
        green
        $ bh_rot18 terra
        lwjjs
        $ bh_rot47 adjust

        $ bh_rot5 terra
        yjwwf


bh_rotall is an implementation that accesses rot generating 1..25 results to rot.

.. code-block:: bash

    $ bh_rotall urfn
    ROT1 vsgo
    ROT2 wthp
    ROT3 xuiq
    ROT4 yvjr
    ROT5 zwks
    ROT6 axlt
    ROT7 bymu
    ROT8 cznv
    ROT9 daow
    ROT10 ebpx
    ROT11 fcqy
    ROT12 gdrz
    ROT13 hesa
    ROT14 iftb
    ROT15 jguc
    ROT16 khvd
    ROT17 liwce
    ROT18 mjxf
    ROT19 nkyg
    ROT20 olzh
    ROT21 pmai
    ROT22 qnbj
    ROT23 rock
    ROT24 spdl
    ROT25 tqem


bh_strxor
---------

Calculates exclusive OR of each character in a string with a key.

.. note:: Usage
    
    ``bh_strxor`` [key]  [string]

    key : int or hex

    string: string to code or decode


.. code-block:: bash
    
   $ bh_strxor 15 'hack'
   gnld

   $ bh_strxor 15 'gnld'
   hack




