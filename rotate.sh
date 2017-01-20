#!/bin/bash

/usr/bin/indexer -c /etc/sphinxsearch/sphinx.conf --rotate --all
./restart.sh