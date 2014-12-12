{ fetchGit, haskellPackages }:

stdenv.mkDerivation {
  name = "panhandle";

  src = fetchGit {
    url = git://gitorious.org/pan-handler/pan-handler.git;
    rev = "541c94f";
    sha256 = "0xy085sfd9dy8bg1ngw9svll96xyxck2yylq7c6jw3lpg7b71if6";
  };

  buildInputs = [ haskellPackages.ghc haskellPackages.pandoc ];

  buildPhase = ''
    ghc --make panhandle.hs
  '';

  installPhase = ''
    mkdir -p "$out/bin"
    cp panhandle "$out/bin/"
  '';
}