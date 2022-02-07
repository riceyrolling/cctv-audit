# IP Camera Audit

A simple bash loop to download a single snapshot (jpeg/png) from each camera in IP range. Uses onvif and onvif-snapshot npm modules.
## Installation
Requires NodeJS and npm dependencies

    git clone https://github.com/riceyrolling/cctv-audit
    cd cctv-audit
    sudo apt install nodejs npm
    npm install

## Usage
    ./audit.sh [start ip] [end ip] [username] [password]
