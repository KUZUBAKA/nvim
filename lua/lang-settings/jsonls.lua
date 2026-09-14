local dir = vim.fn.stdpath("data") .. "/bedrock-schemas"
if not vim.uv.fs_stat(dir) then
 vim.fn.system({ "git", "clone", "--depth", "1", "https://github.com/Blockception/Minecraft-bedrock-json-schemas.git", dir })
end
local base = "file://" .. dir "/"

local list = {
 { "general/manifest.json", { "manifest.json" } },
 { "general/world_x_packs.json", { "world_behavior_packs.json", "world_resource_packs.json" } },
 { "language/languages.json", { "languages.json" } },
 { "language/language_names.json", { "language_names.json" } },
 { "skinpacks/skins.json", { "skins.json" } },
 { "behavior/entities/entities.json", { "**/entities/**/*.json" } },
 { "behavior/items/items.json", { "**/items/**/*.json", "!**/*[Rr]esource*/**", "!**/[Rr][Pp]/**" } },
 { "behavior/blocks/blocks.json", { "**/blocks/**/*.json" } },
 { "behavior/recipes/recipes.json", { "**/recipes/**/*.json" } },
 { "behavior/loot_tables/loot_tables.json", { "**/loot_tables/**/*.json" } },
 { "behavior/spawn_rules/spawn_rules.json", { "**/spawn_rules/**/*.json" } },
 { "behavior/trading/trading.json", { "**/trading/**/*.json" } },
 { "behavior/dialogue/dialogue.json", { "**/dialogue/**/*.json" } },
 { "behavior/features/features.json", { "**/features/**/*.json" } },
 { "behavior/feature_rules/feature_rules.json", { "**/feature_rules/**/*.json" } },
 { "behavior/item_catalog/crafting_item_catalog.json", { "**/item_catalog/**/*.json" } },
 { "behavior/voxel_shapes/voxel_shape.json", { "**/voxel_shapes/**/*.json" } },
 { "behavior/functions/tick.json", { "**/functions/tick.json" } },
 { "behavior/cameras/presets/cameras.json", { "**/cameras/presets/**/*.json" } },
 { "behavior/worldgen/jigsaw_structures/jigsaw.json", { "**/worldgen/structures/**/*.json" } },
 { "behavior/worldgen/processors/processor_list.json", { "**/worldgen/processors/**/*.json" } },
 { "behavior/worldgen/structure_sets/structure_set.json", { "**/worldgen/structure_sets/**/*.json" } },
 { "behavior/worldgen/template_pools/template_pool.json", { "**/worldgen/template_pools/**/*.json" } },
 { "resource/attachables/attachables.json", { "**/attachables/**/*.json" } },
 { "resource/entity/entity.json", { "**/entity/**/*.json", "!**/models/**" } },
 { "resource/render_controllers/render_controllers.json", { "**/render_controllers/**/*.json" } },
 { "resource/models/entity/model_entity.json", { "**/models/**/*.json" } },
 { "resource/particles/particles.json", { "**/particles/**/*.json" } },
 { "resource/fog/fog.json", { "**/fogs/**/*.json" } },
 { "resource/block_culling/block_culling.json", { "**/block_culling/**/*.json" } },
 { "resource/materials/materials.json", { "**/materials/**/*.material" } },
 { "resource/ui/ui.json", { "**/ui/**/*.json", "!**/textures/**", "!**/_ui_defs.json", "!**/_global_variables.json" } },
 { "resource/ui/_ui_defs.json", { "**/_ui_defs.json" } },
 { "resource/ui/_global_variables.json", { "**/_global_variables.json" } },
 { "resource/textures/ui_texture_definition.json", { "**/textures/ui/**/*.json" } },
 { "resource/textures/item_texture.json", { "item_texture.json" } },
 { "resource/textures/terrain_texture.json", { "terrain_texture.json" } },
 { "resource/textures/flipbook_textures.json", { "flipbook_textures.json" } },
 { "resource/textures/textures_list.json", { "textures_list.json" } },
 { "resource/textures/texture_set.json", { "**/*.texture_set.json" } },
 { "resource/blocks.json", { "blocks.json" } },
 { "resource/sounds.json", { "sounds.json" } },
 { "resource/biomes_client.json", { "biomes_client.json" } },
 { "resource/sounds/music_definitions.json", { "music_definitions.json" } },
 { "resource/atmospherics/atmospherics.json", { "**/atmospherics/**/*.json" } },
 { "resource/color_grading/color_grading.json", { "**/color_grading/**/*.json" } },
 { "resource/lighting/lighting.json", { "**/lighting/**/*.json" } },
 { "resource/local_lighting/local_lighting.json", { "local_lighting.json" } },
 { "resource/water/water.json", { "**/water/**/*.json" } },
 { "resource/pbr/pbr.json", { "**/pbr/**/*.json" } },
 { "resource/shadows/shadows.json", { "**/shadows/**/*.json" } },
 { "resource/point_lights/point_lights.json", { "**/point_lights/**/*.json" } },
 { "behavior/animations/animations.json", { "**/*[Bb]ehavior*/**/animations/**/*.json", "**/[Bb][Pp]/**/animations/**/*.json" } },
 { "resource/animations/actor_animation.json", { "**/*[Rr]esource*/**/animations/**/*.json", "**/[Rr][Pp]/**/animations/**/*.json" } },
 { "behavior/animation_controllers/animation_controller.json", { "**/*[Bb]ehavior*/**/animation_controllers/**/*.json", "**/[Bb][Pp]/**/animation_controllers/**/*.json" } },
 { "resource/animation_controllers/animation_controller.json", { "**/*[Rr]esource*/**/animation_controllers/**/*.json", "**/[Rr][Pp]/**/animation_controllers/**/*.json" } },
 { "behavior/biomes/biomes.json", { "**/*[Bb]ehavior*/**/biomes/**/*.json", "**/[Bb][Pp]/**/biomes/**/*.json" } },
 { "resource/biomes/biomes.json", { "**/*[Rr]esource*/**/biomes/**/*.json", "**/[Rr][Pp]/**/biomes/**/*.json" } },
 { "behavior/sounds/server_sound_definitions.json", { "**/*[Bb]ehavior*/**/sound_definitions.json", "**/[Bb][Pp]/**/sound_definitions.json" } },
 { "resource/sounds/sound_definitions.json", { "**/*[Rr]esource*/**/sound_definitions.json", "**/[Rr][Pp]/**/sound_definitions.json" } },
 { "resource/items/items.json", { "**/*[Rr]esource*/**/items/**/*.json", "**/[Rr][Pp]/**/items/**/*.json" } },
}

return function()
 local schemas = {}

 for _, v in ipairs(list) do
  schemas[#schemas + 1] = { url = base .. v[1], fileMatch = v[2] }
 end

 vim.lsp.config("jsonls", {
  settings = {
   json = {
    validate = { enable = true },
    schemas = schemas,
   },
  },
 })
end
