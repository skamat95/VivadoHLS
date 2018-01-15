#include <memory>
#include <iostream>
#include <vector>
#include <cmath>

#include "fuzzer.h"
#include "CordicXIP.h"
#include "CordicXilinx.h"

int main (int argc, char ** argv)
{
    // CordicXIP(int inputBits, int magBits, int phiBits);
    CordicXIP xilinx(24, 19, 19);
    // CordicXilinx(int inputBits, int outputBits, int phiScale);
    CordicXilinx nick(24, 19, argc > 2);
    
    auto compare = [&xilinx,&nick](int x, int y) -> bool
    {
        int phase1;
        unsigned mag1;
        nick(x, y, phase1, mag1);
        int phase2;
        unsigned mag2;
        xilinx(x, y, phase2, mag2);
        if ( mag1 != mag2 || phase1 != phase2 ) return false;
        return true;
    };


    if (argc == 3) {
        // Test x and y inputs
        int32_t phaseOut;
        uint32_t magOut;
        int x = atoi(argv[1]);
        int y = atoi(argv[2]);
        nick(x, y, phaseOut, magOut);
        std::cout << "me  mag = " << magOut << ", phase = " << phaseOut << std::endl;
        xilinx(x, y, phaseOut, magOut);
        std::cout << "XIP mag = " << magOut << ", phase = " << phaseOut << std::endl;
        magOut = sqrt(x*1.*x+y*1.*y)/32.;
        phaseOut = pow(2.,16)*atan2(y*1.,x*1.);
        std::cout << "FPU mag = " << magOut << ", phase = " << phaseOut << std::endl;
    }
    else if (argc == 2)
    {
        // Test phi LSB at a few radii
        int count = 0;
        int range = 205887;
        std::vector<int> radii({1, 23405, 840, 1200003, 123456, 8388608});
        for(int r : radii)
        {
            for(int i=-range; i<=range; ++i)
            {
                int a = r*cos(i*M_PI/range);
                int b = r*sin(i*M_PI/range);
                if ( !compare(a, b) )
                {
                    count++;
                }
            }
        }
        std::cout << "Bad angle count: " << count << " of " << (2*range+1)*radii.size() << std::endl;

        // Test some values from Ben
        std::vector<int> xin({0x00036E, 0x00032B, 0xFFF970, 0xFFF9AE, 0x00040E, 0x000480});
        std::vector<int> yin({0x0000D7, 0xFFFF80, 0xFFFD9C, 0xFFFE23, 0x000369, 0x0003C6});
        std::vector<int> mag  ({0x0001C, 0x00019, 0x00038, 0x00034, 0x0002A, 0x0002E});
        std::vector<int> phase({0x03D56, 0x7D7E0, 0x5350C, 0x52516, 0x0B38C, 0x0B30C});
        // fix int size
        for(auto& x : xin) if ( x > 1<<23 ) x -= 1<<24;
        for(auto& y : yin) if ( y > 1<<23 ) y -= 1<<24;
        for(auto& x : phase) if ( x > 1<<18 ) x -= 1<<19;

        for(int i=0; i<6; ++i)
        {
            int nphase;
            uint32_t nmag;
            nick(xin[i], yin[i], nphase, nmag);
            std::cout << xin[i] << ", " << yin[i] << " --> " << mag[i] << ", " << phase[i] << "      " << nmag << ", " << nphase << ", " << ( compare(xin[i], yin[i]) ? "good":"bad" ) << std::endl;
        }
    }
    else
    {
        // Test random input
        auto callback = [&compare](std::array<uint32_t, 2> rand) -> bool
        {
            // Uniform in [-2^23, 2^23)
            int x = (rand[0]>>8)-(1<<23);
            int y = (rand[1]>>8)-(1<<23);
            return compare(x, y);
        };
        Fuzzer<2> fuzzer;
        fuzzer.fuzz(callback);
    }
}
