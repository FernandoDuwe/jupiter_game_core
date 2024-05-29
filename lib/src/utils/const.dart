// Enums
enum JupiterJoystickDirection { idle, up, down, left, right }

// Event Type
typedef JupiterOnChangeDirection = void Function(
    JupiterJoystickDirection prNewDirection);
