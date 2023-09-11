#!usr/bin/env raku
use lib 'lib';
use Raylib::Generator;

sub configure{
    my $library_name = 'raylib';
    my $exitcode = shell("pkg-config --exists $library_name").exitcode;
    my $failed = $exitcode == 1;
    die "raylib is isn't installed, please install it" if $failed;

    my $srcdir = $*CWD;
    my $output-dir="$srcdir/resources";
    my $raylib-h-file = "/usr/local/include/raylib.h";
    mkdir($output-dir);
    generate-bindings($raylib-h-file, $output-dir);
}

sub install {
    say "instlling yo";
    my $repo = %*ENV<DESTREPO>
        ?? CompUnit::RepositoryRegistry.repository-for-name(%*ENV<DESTREPO>)
        !! (
            CompUnit::RepositoryRegistry.repository-for-name('site'),
            |$*REPO.repo-chain.grep(CompUnit::Repository::Installable)
        ).first(*.can-install)
        or die "Cannot find a repository to install to";
    say "Installing into $repo";
    my $dist = Distribution::Path.new($*CWD);

    # workaround for missing proper handling of libraries in Distribution::Path
    my $libraylib;
    $dist.meta<files> = (
        |$dist.meta<files>.grep(* ne $libraylib.Str),
        {'resources/libraries/libraylib' => $libraylib},
    );

    $repo.install($dist);
    say "Installed successfully.";
}


sub MAIN(:$install is copy) {
    configure if !$install;
    install if $install;
}