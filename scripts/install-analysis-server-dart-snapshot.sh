#!/usr/bin/env bash

set -eux

DART_VERSION=2.7.1
DIR=~/.cache/lsp/dart

mkdir -p ${DIR}

curl -o ${DIR}"/dartsdk.zip" "https://storage.googleapis.com/dart-archive/channels/stable/release/${DART_VERSION}/sdk/dartsdk-macos-x64-release.zip"
unzip -d ${DIR} ${DIR}"/dartsdk.zip"
rm ${DIR}"/dartsdk.zip"

cat <<EOF >${DIR}/analysis-server-dart-snapshot
#!/usr/bin/env bash

${DIR}/dart-sdk/bin/dart ${DIR}/dart-sdk/bin/snapshots/analysis_server.dart.snapshot --lsp \$*
EOF

chmod +x ${DIR}/analysis-server-dart-snapshot

ln -s ${DIR}/analysis-server-dart-snapshot /usr/local/bin/.
