// Create a bumpy surface by using procedural noise to generate a new 3D position
// via displacement in normal direction.
vec3 bump_position(bool is_mercury, bool is_venus, bool is_earth, bool is_mars, vec3 s)
{
  /////////////////////////////////////////////////////////////////////////////
  vec3 p = s + bump_height(is_mercury, is_venus, is_earth, is_mars, s) * normalize(s);
  return p;
  /////////////////////////////////////////////////////////////////////////////
}
