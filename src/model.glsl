// Construct the model transformation matrix. The moon should orbit around the
// origin. The other object should stay still.
// mat4 model(bool is_ball_a, bool is_ball_b, bool is_ball_c, float time)
// {
//   /////////////////////////////////////////////////////////////////////////////
//   if (is_ball_a) {
//     float theta = - mod(time, 4.0) * (M_PI / 2);
//     return rotate_about_y(theta) * uniform_scale(0.3);
//   }

//   if (is_ball_b) {
//     float theta = - mod(time, 4.0) * (M_PI / 2);
//     return (rotate_about_random_axis(theta, normalize(vec3(1.0, 1.0, 0.0))) * uniform_scale(0.3));
//     // return rotate_about_y(theta) * rotate_about_z(theta) * uniform_scale(0.4);
//   }

//   if (is_ball_c) {
//     float theta = - mod(time, 4.0) * (M_PI / 2);
//     return rotate_about_z(theta) * uniform_scale(0.5);
//   }

//   return identity();
//   /////////////////////////////////////////////////////////////////////////////
// }

mat4 model(bool is_mercury, bool is_venus, bool is_earth, bool is_mars, float time)
{
  /////////////////////////////////////////////////////////////////////////////
  if (is_mercury) {
    float theta = - mod(time, 0.4) * (M_PI / 2);
    return rotate_about_y(theta)*uniform_scale(0.01, 4);
  }

  if (is_venus) {
    float theta = - mod(time, 3.0) * (M_PI / 2);
    return rotate_about_y(theta) * uniform_scale(0.07, 7);
    // return (rotate_about_random_axis(theta, normalize(vec3(1.0, 1.0, 0.0))) * uniform_scale(0.07));
    // return rotate_about_y(theta) * rotate_about_z(theta) * uniform_scale(0.4);
  }

  if (is_earth) {
    float theta = - mod(time, 20.0) * (M_PI / 2);
    return rotate_about_y(theta) * uniform_scale(0.09, 10);
  }

  if (is_mars) {
    float theta = - mod(time, 14.0) * (M_PI / 2);
    return rotate_about_y(theta) * uniform_scale(0.1, 14);
  }

  return (rotate_about_random_axis(- mod(time, 14.0) * (M_PI / 2), normalize(vec3(2.0, 0.7, 0.3))) * uniform_scale(1, 0));
  /////////////////////////////////////////////////////////////////////////////
}
