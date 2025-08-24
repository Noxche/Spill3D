# Scripts Organization

This directory contains all game scripts organized by functionality.

## Structure

### Core/
- `GameManager.cs` - Main game state management
- `SceneManager.cs` - Scene loading and transitions
- `SaveSystem.cs` - Save/load functionality
- `EventSystem.cs` - Global event management

### Player/
- `PlayerController.cs` - Player movement and input
- `PlayerCamera.cs` - Camera controls
- `PlayerStats.cs` - Player statistics and progression
- `PlayerInventory.cs` - Inventory management

### AI/
- `NPCController.cs` - NPC behavior base class
- `NPCDialogue.cs` - Dialogue system for NPCs
- `PathfindingAgent.cs` - AI navigation
- `BehaviorTree.cs` - AI decision making

### UI/
- `MainMenu.cs` - Main menu functionality
- `HUD.cs` - In-game user interface
- `DialogueUI.cs` - Dialogue interface
- `InventoryUI.cs` - Inventory interface
- `SettingsMenu.cs` - Game settings

### Managers/
- `AudioManager.cs` - Audio system management
- `InputManager.cs` - Input handling
- `LocalizationManager.cs` - Multi-language support
- `GraphicsManager.cs` - Graphics settings

### Systems/
- `WeatherSystem.cs` - Dynamic weather
- `DayNightCycle.cs` - Time progression
- `QuestSystem.cs` - Quest management
- `InteractionSystem.cs` - Object interaction

### Utilities/
- `Extensions.cs` - Utility extension methods
- `Constants.cs` - Game constants
- `Helpers.cs` - Helper functions
- `DebugTools.cs` - Development utilities

## Coding Standards

- Use PascalCase for classes and public methods
- Use camelCase for fields and local variables
- Add XML documentation for public APIs
- Follow Unity's component-based architecture
- Keep classes focused and single-purpose
- Use interfaces for extensibility

## Norwegian Game Elements

Consider implementing:
- Norwegian language localization
- Traditional Norwegian names for NPCs
- Cultural references and traditions
- Weather patterns typical of Trondheim
- Local transportation systems
- Norwegian holidays and events
