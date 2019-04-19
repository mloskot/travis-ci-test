#include <cstdio>
using namespace std;
int main()
{
    printf("This is test1\n");

#ifdef __GLIBCXX__
    printf("XXXXXXXX __GLIBCXX__=%d\n", __GLIBCXX__);
#endif

    return 0;
}
