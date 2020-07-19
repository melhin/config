export DEBIAN_FRONTEND=noninteractive
apt-get update
apt-get install \
  software-properties-common \
  git \
  build-essential \
  libssl-dev \
  libffi-dev \
  python3-dev \
  python3-pip \
  python3-setuptools \
  python3-virtualenv \
  bind9-host \
  jq -y

git clone "https://github.com/trailofbits/algo" -b master algo
cd algo

python3 -m virtualenv --python="$(command -v python3)" .venv
# shellcheck source=/dev/null
. .venv/bin/activate
python3 -m pip install -U pip virtualenv
python3 -m pip install -r requirements.txt

chmod +x algo

./algo
