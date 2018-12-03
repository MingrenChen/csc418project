uniform mat4 view;
uniform mat4 proj;
uniform float animation_seconds;
uniform bool is_mars;
uniform bool is_venus;
uniform bool is_earth;
uniform bool is_mercury;

in vec3 sphere_fs_in;
in vec3 normal_fs_in;
in vec4 pos_fs_in;
in vec4 view_pos_fs_in;

out vec3 color;
void main()
{
  /////////////////////////////////////////////////////////////////////////////
  vec3 ka = vec3(0.08, 0.08, 0.08);
  vec3 kd = vec3(1,12,999);
  vec3 ks = vec3(8,8,0.8);
  float p = 8.0;

  vec3 t = vec3(0, 0, 0);

  if (is_mercury) {
    ka = vec3(0.03, 0.23, 0.23);
    kd = vec3(0/255.0, 255/255.0, 15/255.0);

    t = vec3(2 / 0.3, 0, 0);
  } else if (is_venus) {
    ka = vec3(0.33, 0.13, 0.13);
    kd = vec3(255/255.0, 143/255.0, 0/255.0);
  } else if (is_earth) {
    ka = vec3(0.4, 0.03, 0.13);
    kd = vec3(255/255.0, 191/255.0, 246/255.0);
  } else if (is_mars){
    ka = vec3(0.4, 0.03, 0.13);
    kd = vec3(255/255.0, 191/255.0, 246/255.0);
  }

  mat4 vm = view * model(is_mercury, is_venus, is_earth, is_mars, animation_seconds);
  mat4 shift = translate(t);

  vec4 view_direction = view * view_pos_fs_in;
  float light_theta = animation_seconds * M_PI / 4;

  // normal map
  float epsilon = 0.00001;

  vec3 T = vec3(0, 0, 0);
  vec3 B = vec3(0, 0, 0);
  tangent(sphere_fs_in, T, B);

  vec3 pos = bump_position(is_mercury, is_venus, is_earth, is_mars, sphere_fs_in);
  vec3 pos_T = bump_position(is_mercury, is_venus, is_earth,is_mars,  sphere_fs_in + epsilon * T);
  vec3 pos_B = bump_position(is_mercury, is_venus, is_earth, is_mars, sphere_fs_in + epsilon * B);
  vec3 normal = cross((pos_T - pos) / epsilon, (pos_B - pos) / epsilon);

  if (dot(pos, normal) < 0) {
    normal = -1 * normal;
  }
  normal = normalize((inverse(shift) * inverse(transpose(vm)) * vec4(normal, 1.0)).xyz);

  // Blinn- phong
  vec3 l = (rotate_about_y(light_theta) * view * vec4(17.3, 23, 0.0, 1.0)).xyz;
  vec3 v = (view_direction).xyz - sphere_fs_in;
  color = blinn_phong(ka, kd, ks, p, normal, v, l);
  /////////////////////////////////////////////////////////////////////////////
}
