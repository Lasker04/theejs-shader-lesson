uniform vec2 uFrequency;
uniform float uTime;

varying vec2 vUv; // fragmentShaderに渡すための変数
varying float vEvelation;

void main() {

  vec4 modelPosition = modelMatrix * vec4(position, 1.0);

  // modelPosition.z += 0.3;
  float evelation = sin(modelPosition.x * uFrequency.x + uTime) * 0.1;
  evelation += sin(modelPosition.y * uFrequency.y + uTime) * 0.1;
  // modelPosition.z += sin(modelPosition.x * uFrequency.x + uTime) * 0.1; // +：波を遅らせる。 -：波を進ませる
  // modelPosition.z += sin(modelPosition.y * uFrequency.y + uTime) * 0.1;

  modelPosition.z += evelation;

  // modelPosition.y *= 0.6;

  vec4 viewPosition = viewMatrix * modelPosition;
  vec4 projectionPosition = projectionMatrix * viewPosition;
  gl_Position = projectionPosition;
  // gl_Position = projectionMatrix * viewMatrix * modelMatrix * vec4(position, 1.0); // 3Dのものを2Dとして表示するために行列を座標変換する

  vUv = uv;
  vEvelation = evelation;
}

