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
Enter a network CIDR mask and know the amount of hosts

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


bh_ipinfo
---------

Query ipinfo.io returns basic info about address.

.. note:: 

    Usage
        
        ``bh_ipinfo`` [ ipaddress ]

.. code-block:: bash 

    $ $ bh_ipinfo 8.8.8.8
    {
     "ip": "8.8.8.8",
     "hostname": "dns.google",
     "anycast": true,
     "city": "Mountain View",
     "region": "California",
     "country": "US",
     "loc": "37.4056,-122.0775",
     "org": "AS15169 Google LLC",
     "postal": "94043",
     "timezone": "America/Los_Angeles",
     "readme": "https://ipinfo.io/missingauth"
    } 


bh_unshort
---------

With this function you have the possibility to unshort a URL see below a example.

.. note::

    Usage
        
        ``bh_unshort`` [ URL string ] 
        
.. code-block:: bash

    $ bh_unshort http://goo.gl/l6MS
    http://googleblog.blogspot.com/2009/12/making-urls-shorter-for-google-toolbar.html


bh_ipisblacklisted
---------

Search for occurrence of the ip address in some  blacklist returning [T] if positive and [F] if it is opposite..

.. note::

    Usage
        
        ``bh_ipblacklist`` [ ipaddress ] 
        
.. code-block:: bash

    $ bh_ipblacklist 77.xxx.xx.xx
    == 77.xxx.xx.xx ==
    [F]    TALOS
    [F]    Malc0de
    [F]    Projecthoneypot.org
    [F]    blocklist.de
    [T]    Alienvault
    [F]    SANS-TOPSOURCE

    #if ipaddress is not informed will be considered the outside

    $ bh_ipblacklist
    == 189.x.xxx.x ==
    [F]    TALOS
    [F]    Malc0de
    [F]    blocklist.de
    [F]    Alienvault
    [T]    SANS-TOPSOURCE

