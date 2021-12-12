module.exports = {
  verbose: true,
  testURL: 'https://templatus-stimulus.test/',
  roots: ['spec/javascript'],
  moduleDirectories: ['node_modules', 'app/javascript'],
  moduleNameMapper: {
    '^@/(.*)$': '<rootDir>/app/javascript/$1',
    '^@test/(.*)$': '<rootDir>/spec/javascript/$1',
    '\\.(jpg|jpeg|png|gif|eot|otf|webp|svg|ttf|woff|woff2|mp4|webm|wav|mp3|m4a|aac|oga)$':
      'jest-transform-stub',
  },
  moduleFileExtensions: ['js', 'json'],
  testMatch: ['**/?(*.)+(spec|test).+(js|jsx)'],
  testEnvironment: 'jsdom',
  snapshotSerializers: [],
};
