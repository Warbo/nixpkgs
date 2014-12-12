{stdenv, fetchgit, coq}:

stdenv.mkDerivation rec {

  name = "coq-pidetop-${coq.coq-version}-${version}";
  version = "20141202";

  src = fetchgit {
    url = https://bitbucket.org/Carst/pidetop.git;
    rev = "259235ed79391a172a93772d147d0f4a358ee9b2";
    sha256 = "1c9mk47brs86wihwkiqv08pv347q6pbsb00zihs7cbwyj09w9cns";
  };

  buildInputs = [ coq.ocaml coq.camlp5 ];
  propagatedBuildInputs = [ coq ];

  enableParallelBuilding = true;

  configurePhase = ''
    export COQBIN=
    coq_makefile -f Make > Makefile
  '';

  #installFlags = "COQLIB=$(out)/lib/coq/${coq.coq-version}/";

  buildPhase = ''
    export COQLIB=$(out)/lib/coq/${coq.coq-version}/
    make install-toploop
  '';

  meta = with stdenv.lib; {
    description = "Async command & control for Coq proof assistant";
    platforms = coq.meta.platforms;
  };

}
