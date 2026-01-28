#define BOOST_TEST_DYN_LINK
#include <boost/test/unit_test.hpp>
#include "Configuration.hpp"
#include "matrixIO.hpp"

BOOST_AUTO_TEST_SUITE(MatrixLoadTests)

BOOST_AUTO_TEST_CASE(MatrixLoadTest)
{
  Eigen::MatrixXd test_matrix(3, 3);
  test_matrix << 0.680375, 0.59688, -0.329554, -0.211234, 0.823295, 0.536459, 0.566198,
      -0.604897, -0.444451;

  Eigen::MatrixXd read_matrix = matrixIO::openData("../data/m3.csv", 3);

  BOOST_TEST(test_matrix.cwiseEqual(read_matrix).all());
}

BOOST_AUTO_TEST_SUITE_END()
