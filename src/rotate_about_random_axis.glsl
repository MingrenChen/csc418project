// Inputs:
//   theta  amount y which to rotate (in radians)
//   axis  a self defined axis to rotate around (normalized unit vector)
// Return a 4x4 matrix that rotates a given 3D point/vector about the y-axis by
// the given amount.
mat4 rotate_about_random_axis(float theta, vec3 axis)
{
  /////////////////////////////////////////////////////////////////////////////
  return mat4(
  cos(theta) + axis.x * axis.x * (1 - cos(theta)),
  axis.x * axis.y * (1 - cos(theta)) - axis.z * sin(theta),
  axis.x * axis.z * (1 - cos(theta)) + axis.y * sin(theta), 0,

  axis.x * axis.y * (1 - cos(theta)) + axis.z * sin(theta),
  cos(theta) + axis.y * axis.y * (1 - cos(theta)),
  axis.y * axis.z * (1 - cos(theta)) - axis.x * sin(theta), 0,

  axis.x * axis.z * (1 - cos(theta)) - axis.y * sin(theta),
  axis.z * axis.y * (1 - cos(theta)) + axis.x * sin(theta),
  cos(theta) + axis.z * axis.z * (1 - cos(theta)), 0,

  0, 0, 0, 1.0);
  /////////////////////////////////////////////////////////////////////////////
}
