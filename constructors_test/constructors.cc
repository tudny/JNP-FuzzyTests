#include "../fuzzy.h"
#include "../logger.h"
#include "../utils.h"
#include <cassert>

TriFuzzyNum num1(1.25, 2.25, 3.25);
TriFuzzyNum num2(2.25, 3.25, 1.25);
constexpr TriFuzzyNum num3(1.25, 2.25, 3.25);
constinit static TriFuzzyNum num4(1.25, 2.25, 3.25);

int main() {
    using std::cout;
    cout << num1 << "\n";
    cout << num2 << "\n";
    cout << num3 << "\n";
    cout << num4 << "\n";

    assert(Utils::equals(num1, num2));
    assert(Utils::equals(num1, num3));
    assert(Utils::equals(num1, num4));
    assert(Utils::equals(num2, num3));
    assert(Utils::equals(num2, num4));
    assert(Utils::equals(num3, num4));
}
