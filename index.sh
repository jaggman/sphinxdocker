#!/bin/bash

/usr/bin/indexer -c /etc/sphinxsearch/sphinx.conf --all
./restart.sh