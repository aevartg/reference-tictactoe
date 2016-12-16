#!/bin/bash

set -e

sleep 10
npm run migratedb-production
node run.js

exit 0