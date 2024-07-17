#ifndef __OPENBSD_PORT_COMPAT_CATCH2__
#define __OPENBSD_PORT_COMPAT_CATCH2__

#include <catch2/catch_all.hpp>
#include <random>

using Catch::Approx;

namespace Catch {
	using Catch::Matchers::Equals;
	using Catch::Matchers::MatcherBase;
};

#endif // __OPENBSD_PORT_COMPAT_CATCH2__
