function cdtmp
    set tmpdir (mktemp -d /tmp/tmpdir.XXXXXXXX)
    echo "Created: $tmpdir"

    function _cdtmp_cleanup --on-variable PWD --inherit-variable tmpdir
        if test "$PWD" != "$tmpdir"
            echo "Leaving $tmpdir — deleting..."
            rm -rf "$tmpdir"
            functions -e _cdtmp_cleanup
        end
    end

    cd $tmpdir
end
