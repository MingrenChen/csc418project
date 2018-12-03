// Compute Blinn-Phong Shading given a material specification, a point on a
// surface and a light direction. Assume the light is white and has a low
// ambient intensity.
vec3 blinn_phong(
  vec3 ka,
  vec3 kd,
  vec3 ks,
  float p,
  vec3 n,
  vec3 v,
  vec3 l)
{
  /////////////////////////////////////////////////////////////////////////////
  vec3 normal = normalize(n);
  vec3 view = normalize(v);
  vec3 light = normalize(l);
  vec3 half_vector = normalize(l - v);
  vec3 intensity = vec3(1, 1, 1);

  return ka + (kd * intensity) * max(dot(light, normal), 0.0) + (ks * intensity) * pow(max(dot(half_vector, normal), 0.0), p);
  /////////////////////////////////////////////////////////////////////////////
}
