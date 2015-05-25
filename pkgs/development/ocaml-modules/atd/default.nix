{stdenv, menhir, easy-format, buildOcaml, fetchurl, which}:

buildOcaml rec {
  version = "1.1.2";
  name = "atd";

  minimumSupportedOcamlVersion = "4.02";

  src = fetchurl {
    url = "https://github.com/mjambon/atd/archive/v${version}.tar.gz";
    sha256 = "0ef10c63192aed75e9a4274e89c5f9ca27efb1ef230d9949eda53ad4a9a37291";
  };

  installPhase = ''
    mkdir -p $out/bin
    make PREFIX=$out install
  '';

  buildInputs = [ which ];
  propagatedBuildInputs = [ menhir easy-format ];

  meta = with stdenv.lib; {
    homepage = https://github.com/mjambon/atd;
    description = "Syntax for cross-language type definitions";
    license = stdenv.lib.licenses.bsd3;
    maintainers = [ maintainers.jwilberding ];
  };
}
