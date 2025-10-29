function cdtmp
    set tmpdir (mktemp -d /tmp/tmpdir.XXXXXXXX)
    echo "Created: $tmpdir"
    cd $tmpdir
end
