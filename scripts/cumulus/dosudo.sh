
cat > /etc/sudoers.d/root-group <<EOF
%cumulus ALL=(ALL) NOPASSWD: ALL
EOF
