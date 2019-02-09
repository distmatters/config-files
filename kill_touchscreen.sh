#!/bin/bash

id=$(xinput --list | awk -v search="ELAN" \
    '$0 ~ search {match($0, /id=[0-9]+/);\
                  if (RSTART) \
                    print substr($0, RSTART+3, RLENGTH-3)\
                 }'\
     )
xinput disable $id