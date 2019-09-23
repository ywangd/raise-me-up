function view-scripts-rpm() {
    rpm --scripts -qp $1
} 

function unpack-rpm() {
    rpm2cpio ./$1 | cpio -idmv
}

function unpack-deb() {
    local outdir=${2:-"."}

    dpkg-deb -R $1 $outdir
}

function remove-dangling-images() {
    OPTS=
    [[ $(echo $OSTYPE | grep -ie '^linux' ) ]] && OPTS=-r
    docker images -f dangling=true -q | xargs $OPTS docker rmi
}

export GRADLE_SKIP_ALL="-x pmdMain -x findbugsMain -x checkstyleMain -x test -x findbugsTest -x pmdTest -x checkstyleTest"
