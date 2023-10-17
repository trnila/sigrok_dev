#!/bin/bash

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

cat <<EOF  | sudo tee /usr/local/bin/pulseview > /dev/null
#!/bin/bash
cd "$SCRIPT_DIR"
source .envrc
./install/bin/pulseview
EOF
sudo chmod a+x /usr/local/bin/pulseview
