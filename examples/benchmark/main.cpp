/**
 * @file   main.cpp  
 * @author Dennis Sitelew
 * @date   Jun 07, 2016
 *
 * Original author: https://github.com/sdukshis
 * Benchmark different pow implementations
 */

#include <cmath>
#include <benchmark/benchmark.h>

long pow_reqursive(long base, unsigned long exp) {
  if (!exp) {
    return 1;
  }

  return exp % 2 ? base * pow_reqursive(base, exp - 1)
                 : pow_reqursive(base * base, exp / 2);
}

long pow_iterative(long base, unsigned long exp) {
  if (!exp) {
    return 1;
  }

  long result = 1;
  while (exp) {
    if (exp % 2) {
      result *= base;
      --exp;
    } else {
      base *= base;
      exp /= 2;
    }
  }
  return result;
}

void BM_pow_reqursive(benchmark::State &state) {
  while (state.KeepRunning()) {
    long res = pow_reqursive(state.range_x(), state.range_y());
    benchmark::DoNotOptimize(&res);
  }
}

BENCHMARK(BM_pow_reqursive)
    ->ArgPair(3, 10)
    ->ArgPair(3, 13)
    ->ArgPair(3, 42)
    ->ArgPair(3, 345)
    ->ArgPair(5, 10)
    ->ArgPair(5, 13)
    ->ArgPair(5, 42)
    ->ArgPair(5, 345);

void BM_pow_iterative(benchmark::State &state) {
  while (state.KeepRunning()) {
    long res = pow_iterative(state.range_x(), state.range_y());
    benchmark::DoNotOptimize(&res);
  }
}

BENCHMARK(BM_pow_iterative)
    ->ArgPair(3, 10)
    ->ArgPair(3, 13)
    ->ArgPair(3, 42)
    ->ArgPair(3, 345)
    ->ArgPair(5, 10)
    ->ArgPair(5, 13)
    ->ArgPair(5, 42)
    ->ArgPair(5, 345);

void BM_std_pow(benchmark::State &state) {
  while (state.KeepRunning()) {
    long res = std::pow(state.range_x(), state.range_y());
    benchmark::DoNotOptimize(&res);
  }
}

BENCHMARK(BM_std_pow)
    ->ArgPair(3, 10)
    ->ArgPair(3, 13)
    ->ArgPair(3, 42)
    ->ArgPair(3, 345)
    ->ArgPair(5, 10)
    ->ArgPair(5, 13)
    ->ArgPair(5, 42)
    ->ArgPair(5, 345);

BENCHMARK_MAIN()
