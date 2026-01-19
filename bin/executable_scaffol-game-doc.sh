#!/usr/bin/env bash

BASE_DIR="docs"

mkdir -p $BASE_DIR

# 00_overview
mkdir -p $BASE_DIR/00_overview
touch $BASE_DIR/00_overview/{vision.md,pillars.md,style_guide.md,glossary.md}

# 01_game_design
mkdir -p $BASE_DIR/01_game_design/{progression,mechanics,world,quests}
touch $BASE_DIR/01_game_design/core_loop.md
touch $BASE_DIR/01_game_design/progression/{evolution_stages.md,abilities_by_stage.md,world_reactivity.md}
touch $BASE_DIR/01_game_design/mechanics/{movement.md,combat.md,stealth.md,interaction.md}
touch $BASE_DIR/01_game_design/world/{biomes.md,npc_behaviour.md,events.md}
touch $BASE_DIR/01_game_design/quests/{main_story.md,side_quests.md}

# 02_technical_design
mkdir -p $BASE_DIR/02_technical_design/{architecture/systems,rendering,animation,audio,networking}
touch $BASE_DIR/02_technical_design/architecture/{ecs_overview.md,data_structures.md}
touch $BASE_DIR/02_technical_design/architecture/systems/{animation_system.md,physics_system.md,audio_system.md,evolution_system.md,world_event_system.md}
touch $BASE_DIR/02_technical_design/rendering/{voxel_style.md,shaders.md,lighting.md,optimization.md}
touch $BASE_DIR/02_technical_design/animation/{skeletal_pipeline.md,procedural_animation.md,world_animation.md}
touch $BASE_DIR/02_technical_design/audio/{layering.md,sfx_pipeline.md,music_direction.md}
touch $BASE_DIR/02_technical_design/networking/sync_model.md

# 03_art
mkdir -p $BASE_DIR/03_art/{characters,environments,ui,references}
touch $BASE_DIR/03_art/characters/{skeleton_stage.md,muscle_stage.md,skin_stage.md,human_stage.md}
touch $BASE_DIR/03_art/environments/{voxel_elements.md,props.md,fx.md}
touch $BASE_DIR/03_art/ui/{hud.md,menus.md}
touch $BASE_DIR/03_art/references/{moodboards.md,inspirations.md}

# 04_pipeline
mkdir -p $BASE_DIR/04_pipeline
touch $BASE_DIR/04_pipeline/{modeling_pipeline.md,animation_pipeline.md,audio_pipeline.md,build_process.md,testing_pipeline.md}

# 05_requirements
mkdir -p $BASE_DIR/05_requirements/{functional,technical,production}
touch $BASE_DIR/05_requirements/functional/{gameplay_requirements.md,world_requirements.md,ui_require
