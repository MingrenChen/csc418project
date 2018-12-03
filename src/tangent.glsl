// Input:
//   N  3D unit normal vector
// Outputs:
//   T  3D unit tangent vector
//   B  3D unit bitangent vector
void tangent(in vec3 N, out vec3 T, out vec3 B)
{
  /////////////////////////////////////////////////////////////////////////////
  vec3 vz = cross(normalize(N), vec3(0.0, 0.0, 1.0));
  vec3 vy = cross(normalize(N), vec3(0.0, 1.0, 0.0));

  if(length(vz) > length(vy)) {
    T = vz;
  } else {
    T = vy;
  }
  T = normalize(T);
  B = normalize(cross(T, normalize(N)));
  /////////////////////////////////////////////////////////////////////////////
}
