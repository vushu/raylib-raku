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
    $res = $res.trim;
    if !$res {
        say "Searching for raylib.h in usr/include";
        return use-find-raylib-header("/usr/include");
    }
    else {
        my $raylib-h-file = $res.substr(2);
        $raylib-h-file ~= "/$library_name.h";
        return $raylib-h-file;
    }
}

sub use-find-raylib-header($path) {
    my $proc = shell("find $path -name 'raylib.h'", :out);
    my $res = $proc.out.slurp: :close;
    $res = $res.trim;
    die "----- Failed to locate raylib.h! abort installation. -----" if $res.chars eq 0;
    return $res;
}

sub configure{
    my $raylib-h-file = "/usr/local/include/raylib.h";
    my $library_name = 'raylib';
    if $*DISTRO.name ~~ /window/ {
        die "Windows is unsupported for now";
    }
    elsif $*DISTRO.name ~~ /macos/ {
        say "OS is MACOS";
        check-if-installed;
        $raylib-h-file = get-header-from-pkg-config($library_name);
    }
    else {
        say "OS is Linux";
        check-if-installed;
        $raylib-h-file = get-header-from-pkg-config($library_name);

    }
    say "Header file found in: ", $raylib-h-file;
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