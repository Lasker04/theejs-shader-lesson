uniform mat4 projectionMatrix; // 画面に表示される範囲を決める行列に関すること
uniform mat4 modelMatrix; // オブジェクトがどこにある、どの向きにあるのかを決める行列に関すること
uniform mat4 viewMatrix; // カメラがどこにあり、どの方向を向いているのかを決める行列に関すること

attribute vec3 position;

void main() {
  vec4 modelPosition = modelMatrix * vec4(position, 1.0);

  modelPosition.z += 0.3;

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectionPosition = projectionMatrix * viewPosition;
  gl_Position = projectionPosition;
  // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0); // 3Dのものを2Dとして表示するために行列を座標変換する
}

