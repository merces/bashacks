Install
=======

In this section you can find instructions bashacks's installation process, if you have any tips to improve, send your opinion.  ;)

Requirements
------------

* bash >= 4
* bc
* binutils
* coreutils
* curl
* file
* grep
* hexdump
* html2text
* perl
* sed
* wget
* xxd
* zip
* make

We consider that your system has the minimum instalation of packages, if you are using some of the below no problems.

.. code-block:: text

     GNU/Linux
     FreeBSD (new)
     OSX (new)


Download
--------

.. sidebar:: GIT
    
    We recommend the version available on ``MASTER REPOSITORY ON THE GITHUB``, however, if you want to use the development version skip the session    that describe the steps of the GIT

Download the final version, download on the ``GITHUB``. `Download Bashacks`_


GIT
---

Since the end of version ``1.5.0`` we are working with separate branches for various activities, can have errors and problems in ``devel`` repository, but try to keep always clean ``master`` branch to your advantage.


.. code-block:: bash
    
    $ git clone https://github.com/merces/bashacks.git
    $ cd bashacks
    # this's a optional mode, maybe there's some error in the devel branch.
    $ git checkout devel



Compile
-------

.. code-block:: text

    Options 

    all       : Just creates the file bashacks.sh
    install   : Creates the file bashacks.sh, add entry in /etc/bash.bashrc and install man page
    clean     : Just remove the file bashacks.sh
    uninstall : remove reference the source of /etc/bash.bashrc and man page


.. code-block:: bash

    $ make all
    $ source bashacks.sh


Done that all functions can be used use ``bh`` ``TAB`` ``TAB`` and has a ``Sight beyond sight``



.. _`Download bashacks`: https://github.com/merces/bashacks/archive/refs/heads/master.zip 


