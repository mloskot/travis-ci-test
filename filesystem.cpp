// Detect <filesystem> availability

#ifdef __cpp_lib_filesystem
    #include <filesystem>
    using fs = std::filesystem;
#elif __cpp_lib_experimental_filesystem
    #include <experimental/filesystem>
    using fs = std::experimental::filesystem;
#else
    #ifdef CI_TEST_HAS_BOOST_FILESYSTEM
        #define BOOST_FILESYSTEM_VERSION 3
        #include <boost/filesystem.hpp>
        using fs = std::filesystem;
    #endif
#endif

#include <iostream>

int main()
{
    std::cout << "Detecting std::filesystem availability:" << std::endl;

#if defined( __cpp_lib_filesystem)
    std::cout << "using <filesystem>" << std::endl;
#elif defined(__cpp_lib_experimental_filesystem)
    std::cout << "using <experimental/filesystem>" << std::endl;
#elif defined(CI_TEST_HAS_BOOST_FILESYSTEM)
    std::cout << "using <boost/filesystem.hpp>" << std::endl;
#else
    std::cout << "no <filesystem> support" << std::endl;
#endif

    return 0;
}
