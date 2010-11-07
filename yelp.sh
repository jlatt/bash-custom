#!/bin/bash
set -a

if [[ "$YELP_IN_SANDBOX" ]]; then
	PS1="${PS1} ${CNORMAL}[${CRED}sandbox${CNORMAL}]"
fi

SELENIUM_HOST="$SSH_HOST"
#SELENIUM_BROWSER="*safari"

set +a
