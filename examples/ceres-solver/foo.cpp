#include <ceres/ceres.h>
#include <ceres/rotation.h>

using ceres::AutoDiffCostFunction;
using ceres::CostFunction;
using ceres::Problem;
using ceres::Solver;
using ceres::Solve;

struct ModelEqual2
{
	// Calculate the residuals,
	// the input parameters are the ones optimized for
	template <typename T>
	bool operator()(const T* const x,
					T* residual) const {
		residual[0] = T(2) - x[0];
		return true;
	}
};
int main(int argc, char* argv[]) {
  Problem problem;
  // variable to optimize in place
  double x = 0;
  Solver::Options options;
  Solver::Summary summary;
  // AutoDiffCostFunction<Model_to_use, numberOfResiduals, [dimOfParameter]+>
  CostFunction* cost_fun
      = new AutoDiffCostFunction<ModelEqual2, 1, 1>(
        new ModelEqual2());
  problem.AddResidualBlock(cost_fun, NULL, &x);
  Solve(options, &problem, &summary);

  // output optimized result
  std::cout << "x: " << x << std::endl;
}
