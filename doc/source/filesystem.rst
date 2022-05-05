Filesystem
===========

This section in general has funcions for file handling.

bh_bkp
------

Do quick backup of file using the current system date posfixed to the filename

.. note:: 
    Usage

    ``bh_bkp`` [filename]


.. code-block:: bash
    
    $ bh_bkp bashacks.sh
    $ ls -1
    bashacks.sh
    bashacks.sh.20160122


bh_findmime
------------

Find file by mime type

.. note::

    Usage

    ``bh_findmime`` -[type] [directory]

    type : -exe, -msi, -txt or -zip

    directory : path


.. code-block:: bash
    
    $ bh_findmime -exe ~/Downloads
    /home/bashacks/Downloads//binario.exe

    $ bh_findmime -txt ~/Documents
    /home/bashacks/Documents//01-text.txt
    /home/bashacks/Documents//ha.log

    $ bh_findmime -zip ~/
    /home/bashacks//crm.zip

    $ bh_findmime -msi ~/
    /home/bashacks//install.msi



bh_hashes
---------

Generate message digest md5, sha1 and sha256 from file or list of file sent by parameters. 

.. note::

    Usage

    ``bh_hashes`` [filename or list of files]


.. code-block:: bash

    $ $ bh_hashes bashacks.sh 
    5dab37cac730088fd959f8292636fc9b bashacks.sh
    38be74a4e710a3eeb24b4fa2015cea990d4eda67 bashacks.sh
    587b713bb31e3bf32de0b734805c3dd247f49a14cd9e9a5f35008e4f620d3f82 bashacks.sh


bh_md5rename
------------

Convert filename to equivalent digest md5.

.. note::
    
    Usage

    ``bh_md5rename`` [filename or list of files]


.. code-block:: bash

    $ touch ment.bin
    $ bh_md5rename ment.bin 
    $ ls 
    d41d8cd98f00b204e9800998ecf8427e


.. sidebar:: TIP
    
    It's easy compress a file and send it by mail later or protection you from yourself.


bh_secretfile
---------

A nice feature to any skill, use it to compress one or more files, automatically generating a password and upload to the file.io, in the end of process you'll get a URL and password to decompress file.

.. note::

    Usage

    ``bh_secretfile`` [filename]


.. code-block:: bash

    $ cat > ment.bin
    Hi, I'm send this file. 
    $ bh_secretfile ment.bin 
    adding: ment.bin (stored 0%)
    https://file.io/Raan5CUW8ZTW
    NRvC_ZniiEtlwgcrBbI_


bh_sharefile
---------

Just as the bh_secretfile function uploads a file and returns the unique url to access it, this process will not have a password attached, anyone with the URL will be able to download it.

.. note::

    Usage

    ``bh_sharefile`` [filename]


.. code-block:: bash

    $ bh_sharefile texto.txt 
    https://file.io/EGQvRxqyagIY


bh_zipmal
---------

Copress file in zip format with password protection. the password is ``virus``

.. note::

    Usage

    ``bh_zipmal`` [filename]


.. code-block:: bash

    $ bh_zipmal malware.cpl
      adding: malware.cpl (deflated 69%)
    -rw-r--r-- 1 bashacks  users  30k Jan 21 23:57 malware.zip



