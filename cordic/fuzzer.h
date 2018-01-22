/*
 * fuzzer.h : A templated fuzzer for input testing
 *
 * Usage Example:
 *    auto callback = [](std::array<uint32_t, 4> rand) -> bool
 *    {
 *      // return true if test passed
 *      //  false if failed
 *      return true;
 *    };
 *    Fuzzer<4> fuzzer;
 *    fuzzer.fuzz(callback);
 *
 * Author: Nick Smith
 *
 */
#ifndef FUZZER_H
#define FUZZER_H

#include <random>
#include <atomic>
#include <thread>
#include <chrono>

#include <string>
#include <iterator>
#include <iostream>
#include <algorithm>
#include <functional>
#include <array>

template<std::size_t _Nm>
class Fuzzer
{
  public:
    Fuzzer(int seed=42) : rng(seed), runs(0), errors(0), running(false) {};
    void fuzz(std::function<bool(std::array<uint32_t, _Nm>&)> testCallback)
    {
      running = true;
      std::array<uint32_t, _Nm> randomValues;

      std::thread keywatch(&Fuzzer::keywatcher, this);
      std::chrono::time_point<std::chrono::high_resolution_clock> start, end;
      start = std::chrono::high_resolution_clock::now();
      while ( running )
      {
        runs++;
        for(auto& r : randomValues) r = rng();
        if ( ! testCallback(randomValues) ) errors++;

        if ( runs % 100000 == 0 )
        {
          end = std::chrono::high_resolution_clock::now();
          double us = std::chrono::duration_cast<std::chrono::microseconds>(end-start).count();
          start = end;
          printf("\rErrors: % 8d / % 8d  (% 2.2f%%)   Rate: % 4.0f kHz", errors, runs, errors*100. / runs, 1.e8/us);
          std::cout.flush();
        }
      }
      keywatch.join();
    };
    void keywatcher()
    {
      std::cout << "Press q<Enter> to exit" << std::endl;
      char c;
      while(running)
      {
        std::cin >> c;
        if ( c == 'q' )
        {
          running = false;
          std::cout << "Stopping..." << std::endl;
        }
      }
    };

  private:
    std::mt19937 rng;
    int runs;
    int errors;
    std::atomic_bool running;
};

#endif
