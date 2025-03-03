#include "lib.hpp"

auto main() -> int
{
  auto const lib = library {};

  return lib.name == "DicomCandy" ? 0 : 1;
}
