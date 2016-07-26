Network
========


bh_bin2ip
---------
Convert a binary string into network ipaddress.

.. note::

    Usage

        ``bh_bin2ip`` binary string


.. code-block:: bash

     $ bh_bin2ip 00001010.00001010.00000000.00000001 
     10.10.0.1


bh_hostcalc
-----------
Enter a network mask and know the amount of hosts

.. note::
    
    Usage

        ``bh_hostcalc`` [ mask cidr ]

.. code-block:: bash
    
    $ bh_hostcalc 24
    256

    $ bh_hostcalc 25 
    126



bh_ip2bin
---------
Convert network ipaddress into binary string.

.. note:: 
    
    Usage 
    
        ``bh_ip2bin`` [ ipaddress ]

.. code-block:: bash 
    
    $ bh_ip2bin 192.168.0.100
    11000000.10101000.00000000.01100100



bh_ip2geo
---------

This command returnes the approximate location of informate ipaddress.

limited to 70 queries per day.

.. note::

    Usage

        ``bh_ip2geo`` [ ipaddress ]

.. code-block:: bash

    $ bh_ip2geo 8.8.8.8
    Level 3 Communications Google Mountain View US 37.386001586914 -122.08380126953 1 

    # last fiel represents the amount of queries
    $ bh_ip2geo 107.155.91.162
    Austin US 30.310600280762 -97.722702026367 2 


bh_myip
-------

This returns the external ipaddress of your network connection.

.. note::

    Usage

        ``bh_myip``


.. code-block:: bash 

    $ bh_myip
    200.251.1.1 



bh_wgetr
--------

Recursive and continue getting a partially-downloaded "if exist" file started by a previous instance of wget with randomize time.

.. note::

    Usage

        ``bh_wgetr`` [ url ]


.. code-block:: bash 

    $ bh_wgetr http://www.mentebinaria.com.br/artigos/0x1e/0x1e-maqengrevwin.html
    www.mentebinaria.com.br/art 100%[==========================================>]   8.73K  --.-KB/s   in 0s     
    www.mentebinaria.com.br/rob 100%[==========================================>]     361  --.-KB/s   in 0s     
    www.mentebinaria.com.br/art 100%[==========================================>]  66.18K   132KB/s   in 0.5s  
    $ ls -1
    www.mentebinaria.com.br
    $ ls -1 www.mentebinaria.com.br/artigos/0x1e/
    0x1e-maqengrevwin.html
    desktop.png



bh_wget
--------

Download a no-recursive file.

.. note::

    Usage
    
        ``bh_wget`` [ url ]

.. code-block:: bash 

    $ bh_wget http://www.mentebinaria.com.br/artigos/0x1e/0x1e-maqengrevwin.html
    0x1e-maqengrevwin.html   100%[====================================>]   8.73K  --.-KB/s   in 0.001s]
    $ ls -1 
    0x1e-maqengrevwin.html


bh_ipinfo
---------

Query ipinfo.io returns reserved company network range to you, if domain not informed your network should be considered.

.. note:: 

    Usage
        
        ``bh_ipinfo`` [ domain ]

.. code-block:: bash 

    $ bh_ipinfo linuxfoundation.org
    AS3701 Network for Education and Research in Oregon (NERO)
    140.211.0.0/16
    163.41.0.0/16
    192.68.202.0/24 
    ...

    $ bh_ipinfo 
    ASXXXXX YOUR-ISP
    255.0.0.0/8
    255.200.0.0/16
    255.200.200.0/24


