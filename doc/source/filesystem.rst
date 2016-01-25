Filesystem
===========

bh_bkp
------

Do quick backup of file using the current system date to add the file name

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

Generate md5 message digest of file or list of files, 

.. note::

    Usage

    ``bh_hashes`` [filename or list of files]


.. code-block:: bash

    problema


bh_md5rename
------------

Generate md5 message dgest to one or more files and rename it with result.

.. note::
    
    Usage

    ``bh_md5rename`` [filename or list of files]


.. code-block:: bash

    problema


.. sidebar:: TIP
    
    It's easy compress a file and send it by mail later or protection you from yourself.


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



