# Asset Organization Guidelines

This document outlines the organization and naming conventions for all game assets.

## Folder Structure

### 3D Assets
- `Characters/` - All character models
  - `Player/` - Player character variants
  - `NPCs/` - Non-player characters
  - `Enemies/` - Enemy models
- `Environment/` - Environmental assets
  - `Trondheim/` - Trondheim-specific assets
    - `Buildings/` - Building models
    - `Landmarks/` - Famous landmarks (Nidarosdomen, etc.)
    - `Streets/` - Street furniture and elements
    - `Nature/` - Trees, rocks, natural elements
- `Vehicles/` - All vehicle models
- `Props/` - Interactive and decorative objects

### Textures
- Organized by category matching 3D assets
- Include diffuse, normal, roughness, and metallic maps
- Use consistent naming: `AssetName_TextureType.extension`

### Audio
- `Music/` - Background music and ambient tracks
- `SFX/` - Sound effects
- `Voice/` - Dialogue and voice acting

## Naming Conventions

### 3D Models
- Use descriptive names: `TrondheimChurch_Main.fbx`
- Include LOD suffix: `Building_LOD0.fbx`, `Building_LOD1.fbx`
- Use underscore separation

### Textures
- Format: `AssetName_TextureType_Resolution`
- Examples: `TrondheimHouse_Diffuse_1024.png`
- Types: Diffuse, Normal, Roughness, Metallic, AO, Height

### Materials
- Match corresponding texture name: `TrondheimHouse_Material`
- Include surface type: `Wood_Weathered_Material`

## Quality Standards

### 3D Models
- Keep triangle count appropriate for usage
- Provide multiple LOD levels for complex models
- Ensure proper UV mapping
- Include collision meshes where needed

### Textures
- Use power-of-2 dimensions when possible
- Provide multiple resolutions (512, 1024, 2048)
- Use appropriate compression settings
- Include mipmaps for 3D textures

### Audio
- Use appropriate sample rates (44.1kHz for music, 22kHz for SFX)
- Normalize audio levels consistently
- Use compression to manage file sizes
- Provide both stereo and mono versions where appropriate

## Trondheim-Specific Assets

### Architecture
- Focus on distinctive Norwegian architectural styles
- Include traditional wooden buildings
- Model key landmarks accurately
- Consider seasonal variations (snow, etc.)

### Environment
- Norwegian flora and fauna
- Weather-appropriate props
- Cultural elements (flags, signs in Norwegian)
- Fjord and water elements

### Cultural Elements
- Norwegian text and signage
- Traditional crafts and objects
- Seasonal decorations
- Local transportation (trams, buses)
