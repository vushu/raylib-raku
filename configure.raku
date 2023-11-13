#!usr/bin/env raku
use lib 'lib';
use Raylib::Generator;

sub check-if-installed {
    my $library_name = 'raylib';
    my $exitcode = shell("pkg-config --exists $library_name").exitcode;
    my $failed = $exitcode == 1;
    die "raylib is isn't installed, please install it" if $failed;

}

sub get-header-from-pkg-config($library_name) {
    my $proc = shell("pkg-config --cflags $library_name", :out);
    my $res = $proc.out.slurp: :close;
    my $raylib-h-file = $res.trim.substr(2);
    $raylib-h-file ~= "/$library_name.h";
    return $raylib-h-file;
}

sub configure{
    my $raylib-h-file = "/usr/local/include/raylib.h";
    my $library_name = 'raylib';
    if $*DISTRO.name ~~ /window/ {
        die "Windows is unsupported for now";
    }
    elsif $*DISTRO.name ~~ /macos/ {
        say "Is using MACOS";
        check-if-installed;
        $raylib-h-file = get-header-from-pkg-config($library_name);
    }
    else {
        say "Is using linux";
        check-if-installed;
        $raylib-h-file = get-header-from-pkg-config($library_name);

    }
    say $raylib-h-file;
    my $srcdir = $*CWD;
    my $output-dir="$srcdir/resources";
    mkdir($output-dir);
    generate-bindings($raylib-h-file, $output-dir);
}

sub install {
    say "Installing Raylib::Bindings";
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