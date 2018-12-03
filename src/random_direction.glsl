// Generate a pseudorandom unit 3D vector
vec3 random_direction( vec3 seed)
{
  /////////////////////////////////////////////////////////////////////////////
  vec2 rand = random2(seed);
  float theta = rand.x * M_PI;
  float phi = rand.y * 2 * M_PI;
  return vec3(sin(theta) * cos(phi), sin(theta) * sin(phi), cos(theta));
  /////////////////////////////////////////////////////////////////////////////
}
