part of blocs.generator_bloc;

enum GeneratorStates { initial, generating, generated, reseted }

class GeneratorState {
  final GeneratorStates state;
  final int value;
  final Set<int> generatedNumbers;

  const GeneratorState(
    this.state, {
    this.value,
    this.generatedNumbers,
  });

  factory GeneratorState.inital() {
    return GeneratorState(
      GeneratorStates.initial,
      value: 0,
      generatedNumbers: <int>{},
    );
  }

  factory GeneratorState.generating(int value, Set<int> generatedNumbers) {
    return GeneratorState(
      GeneratorStates.generating,
      value: value,
      generatedNumbers: generatedNumbers,
    );
  }

  factory GeneratorState.generated(int value, Set<int> generatedNumbers) {
    return GeneratorState(
      GeneratorStates.generated,
      value: value,
      generatedNumbers: generatedNumbers,
    );
  }

  factory GeneratorState.reset() {
    return GeneratorState(
      GeneratorStates.reseted,
      value: 0,
      generatedNumbers: <int>{},
    );
  }
}
