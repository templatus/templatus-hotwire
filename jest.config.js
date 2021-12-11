module.exports = {
  verbose: true,
  testURL: 'https://templatus-stimulus.test/',
  roots: ['spec/javascript'],
  moduleDirectories: ['node_modules', 'app/javascript'],
  moduleNameMapper: {
    '^@/(.*)$': '<rootDir>/app/javascript/src/$1',
    '^@test/(.*)$': '<rootDir>/spec/javascript/src/$1',
    '\\.(jpg|jpeg|png|gif|eot|otf|webp|svg|ttf|woff|woff2|mp4|webm|wav|mp3|m4a|aac|oga)$':
      'jest-transform-stub',
  },
  moduleFileExtensions: ['js', 'ts', 'json', 'vue'],
  preset: 'ts-jest',
  testMatch: ['**/?(*.)+(spec|test).+(ts|tsx)'],
  transform: {
    '^.+\\.tsx?$': 'ts-jest',
    '^.+\\.vue$': '@vue/vue3-jest',
  },
  testEnvironment: 'jsdom',
  snapshotSerializers: ['<rootDir>/node_modules/jest-serializer-vue'],
};
