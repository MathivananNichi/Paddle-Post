/// Represents the stages of the PaddlePost connection and setup flow.
enum SetupStep {
  /// Initial screen: Instructions and "Find my PaddlePost" button.
  initial,

  /// Searching screen: "Looking for your module…" radar scan.
  searching,

  /// Discovered screen: "Found it." with device card and "Pair" button.
  found,

  /// Pairing screen: "Pairing..." in progress.
  pairing,

  /// Completed screen: "You're all set." with "Let's play" button and "Unpair" option.
  paired;

  bool get isInitial => this == SetupStep.initial;
  bool get isSearching => this == SetupStep.searching;
  bool get isFound => this == SetupStep.found;
  bool get isPairing => this == SetupStep.pairing;
  bool get isPaired => this == SetupStep.paired;
}
