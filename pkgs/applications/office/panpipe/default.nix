{ fetchGit, haskellPackages }:

stdenv.mkDerivation {
  name = "panpipe";

  src = fetchGit {
    url = git://gitorious.org/panpipe/panpipe.git;
    rev = "36e8537";
    sha256 = "0xy085sfd9dy8bg1ngw9svll96xyxck2yylq7c6jw3lpg7b71if5";
  };

  buildInputs = [ haskellPackages.ghc haskellPackages.pandoc ];

  buildPhase = ''
    ghc --make panpipe.hs
  '';

  installPhase = ''
    mkdir -p "$out/bin"
    cp panpipe "$out/bin/"
  '';
}