// Generate a procedural planet and orbiting moon. Use layers of (improved)
// Perlin noise to generate planetary features such as vegetation, gaseous
// clouds, mountains, valleys, ice caps, rivers, oceans. Don't forget about the
// moon. Use `animation_seconds` in your noise input to create (periodic)
// temporal effects.
//
// Uniforms:
uniform mat4 view;
uniform mat4 proj;
uniform float animation_seconds;
uniform bool is_moon;
// Inputs:
in vec3 sphere_fs_in;
in vec3 normal_fs_in;
in vec4 pos_fs_in;
in vec4 view_pos_fs_in;
// Outputs:
out vec3 color;
// expects: model, blinn_phong, bump_height, bump_position,
// improved_perlin_noise, tangent
void main()
{
  /////////////////////////////////////////////////////////////////////////////
  // Replace with your code
  float sum = 0;
  float size = 2;
  float scale = size;
  while (scale >= 0.0000128) {
    sum += improved_perlin_noise(sphere_fs_in / scale) * scale;
    scale /= 2.0;
  }
  float s = sqrt(sin((0.5 * sphere_fs_in.x + 2.8 * sum) * M_PI) + 2.7) * 0.89712;

  vec3 ka = vec3(0.01, 0.02, 0.1);
  vec3 kd = vec3(0.2, 0.3, 0.8);
  vec3 ks = vec3(0.8,0.8,0.8);
  float p = 1000.0;

  vec3 t = vec3(0, 0, 0);

  if (is_moon) {
    t = vec3(2 / 0.3, 0, 0);
  }

  mat4 vm = view * model(is_moon, animation_seconds);
  mat4 shift = translate(t);

  vec4 view_direction = view * view_pos_fs_in;
  float light_theta = animation_seconds * M_PI / 4;

  // normal map
  float epsilon = 0.00001;

  vec3 T = vec3(0, 0, 0);
  vec3 B = vec3(0, 0, 0);
  tangent(sphere_fs_in, T, B);

  vec3 pos = bump_position(is_moon, sphere_fs_in);
  vec3 pos_T = bump_position(is_moon, sphere_fs_in + epsilon * T);
  vec3 pos_B = bump_position(is_moon, sphere_fs_in + epsilon * B);
  vec3 normal = cross((pos_T - pos) / epsilon, (pos_B - pos) / epsilon);
  float dotp = dot(pos, normal);

  if (dotp < 0) {
    normal = -1 * normal;
  }

  normal = normalize((inverse(shift) * inverse(transpose(vm)) * vec4(normal, 1.0)).xyz);

  // Blinn- phong
  vec3 l = (rotate_about_y(light_theta) * view * vec4(17.3, 23, 0.0, 1.0)).xyz;
  vec3 v = (view_direction).xyz - sphere_fs_in;

  float height = bump_height(is_moon, pos);

  // Green land
  if (!is_moon && (bump_height(is_moon, sphere_fs_in) > 0.3)) {
    ka += vec3(0.121, 0.08, 0.011) * 2 * sphere_fs_in;
    kd = vec3(0.43, 0.5, 0.01);
    s = 1.0;
  }

  // Clouds
  float alpha = 0.2 * improved_perlin_noise(sphere_fs_in);
  vec3 rand = vec3(sphere_fs_in.x + sin(animation_seconds * M_PI / 16.0) / 16, 8 * sphere_fs_in.y + sin(animation_seconds * M_PI / 16.0), sphere_fs_in.z + cos(animation_seconds * M_PI / 16.0) / 16);
  alpha = sin(improved_perlin_noise(rand) * M_PI / 2.0);
  if (alpha <= 0.2) {
    alpha = 0;
  } else {
    alpha = 1.3 * abs(alpha);
  }

  if (is_moon) {
    ka = vec3(0.03, 0.03, 0.03) * (1 - height);
    kd = vec3(0.5, 0.5, 0.5);
    s = sqrt(sin((0.5 * sphere_fs_in.x +1.3 * sum) * M_PI) + 1.9) * 0.89712;
    alpha = 0;
  }

  color = blinn_phong(alpha * vec3(1.0, 1.0, 1.0) + (1 - alpha) * s * ka, s * kd, ks, p, normal, v, l);
  /////////////////////////////////////////////////////////////////////////////
}
