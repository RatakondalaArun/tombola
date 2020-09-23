part of blocs.generator_bloc;

abstract class GeneratorEvent {}

/// Generates random number
class GeneratorGenerateRandomEvent extends GeneratorEvent {}

/// Resets the generator to 0
class GeneratorResetEvent extends GeneratorEvent {}
