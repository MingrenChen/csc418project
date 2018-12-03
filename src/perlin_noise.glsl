// Given a 3d position as a seed, compute a smooth procedural noise
// value: "Perlin Noise", also known as "Gradient noise".
float perlin_noise( vec3 st)
{
  /////////////////////////////////////////////////////////////////////////////
  vec3 c1 = floor(st);
  vec3 c8 = ceil(st);
  vec3 c2 = vec3(c8.x, c1.y, c1.z);
  vec3 c3 = vec3(c1.x, c8.y, c1.z);
  vec3 c4 = vec3(c8.x, c8.y, c1.z);
  vec3 c5 = vec3(c1.x, c1.y, c8.z);
  vec3 c6 = vec3(c8.x, c1.y, c8.z);
  vec3 c7 = vec3(c1.x, c8.y, c8.z);

  float d1 = dot(random_direction(c1), normalize(st - c1));
  float d2 = dot(random_direction(c2), normalize(st - c2));
  float d3 = dot(random_direction(c3), normalize(st - c3));
  float d4 = dot(random_direction(c4), normalize(st - c4));
  float d5 = dot(random_direction(c5), normalize(st - c5));
  float d6 = dot(random_direction(c6), normalize(st - c6));
  float d7 = dot(random_direction(c7), normalize(st - c7));
  float d8 = dot(random_direction(c8), normalize(st - c8));

  vec3 weight = smooth_step(st - c1);

  float l1 = d1 + weight.x * (d2 - d1);
  float l2 = d3 + weight.x * (d4 - d3);
  float l3 = d5 + weight.x * (d6 - d5);
  float l4 = d7 + weight.x * (d8 - d7);
  float s1 = l1 + weight.y * (l2 - l1);
  float s2 = l3 + weight.y * (l4 - l3);

  float z = s1 + weight.z * (s2 - s1);

  return z;
  /////////////////////////////////////////////////////////////////////////////
}
