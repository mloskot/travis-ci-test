// Detect <filesystem> availability

#ifdef __cpp_lib_filesystem
    #include <filesystem>
    using fs = std::filesystem;
#elif __cpp_lib_experimental_filesystem
    #include <experimental/filesystem>
    using fs = std::experimental::filesystem;
#endif

#include <iostream>

int main()
{
    std::cout << "Detecting std::filesystem availability:" << std::endl;

#ifdef __cpp_lib_filesystem
    std::cout << "<filesystem>" << std::endl;
#elif __cpp_lib_experimental_filesystem
    std::cout << "<experimental/filesystem>" << std::endl;
#else
    std::cout << "no <filesystem> support" << std::endl;
#endif

    return 0;
}
