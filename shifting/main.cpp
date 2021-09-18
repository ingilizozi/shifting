#include <iostream>

using namespace std;

extern "C" int ShiftTest(unsigned long long& p);
extern "C" void ShiftDoubleTest(unsigned long long& p1, unsigned long long& p2);

void PrintBits(int carry, unsigned long long& p, int bitCount)
{
	cout << "C: " << carry << " ";

	for (int j = bitCount - 1; j >= 0; j--)
		cout << ((p >> j) & 1);

	cout << endl;
}

int main()
{
	unsigned long long p1 = 12341;
	// This is for ShiftDoubleTest function ↓
	unsigned long long p2 = 0b1101010110010111010101011001011101010101100101110101010110010111;

	int carry = 0;

	PrintBits(carry, p1, 64);
	PrintBits(carry, p2, 64); // This is for ShiftDoubleTest function
	cin.get();

	while (true)
	{
		//carry = ShiftTest(p1); // This is for ShiftTest function
		ShiftDoubleTest(p1, p2); // This is for ShiftDoubleTest function
		PrintBits(carry, p1, 64);
		PrintBits(carry, p2, 64); // This is for ShiftDoubleTest function
		cin.get();
	}
}