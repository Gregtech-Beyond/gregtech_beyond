import crafttweaker.world.IFacing;
import crafttweaker.block.IBlock;
import crafttweaker.block.IBlockState;
import crafttweaker.item.IIngredient;
import crafttweaker.item.IItemStack;
import mods.gregtech.multiblock.Builder;
import mods.gregtech.multiblock.FactoryBlockPattern;
import mods.gregtech.multiblock.IBlockMatcher;
import mods.gregtech.multiblock.MultiblockAbility;
import mods.gregtech.multiblock.RelativeDirection;
import mods.gregtech.multiblock.FactoryMultiblockShapeInfo;
import mods.gregtech.multiblock.IBlockInfo;
import mods.gregtech.multiblock.IBlockWorldState;
import mods.gregtech.multiblock.Multiblock;
import mods.gregtech.recipe.RecipeMap;
import mods.gregtech.MetaTileEntities;
import mods.gregtech.recipe.FactoryRecipeMap;
import mods.gregtech.render.ITextureArea;
import mods.gregtech.render.MoveType;
import mods.gregtech.render.ICubeRenderer;
import mods.gregtech.render.Textures;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;


var loc = "gravity_separator";
var meta = 10040;
val gravity_separator = Builder.start(loc, meta)
    .withPattern(
            FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.BACK, RelativeDirection.UP)
                .aisle(
                    "CCCCC~~",
                    "CCCCC~P",
                    "CCCCC~~",
                    "CCCCC~P")
                .aisle(
                    "SCCCC~~",
                    "C~D~CPP",
                    "C~D~CP~",
                    "CCCCCPP")
                .aisle(
                    "CCCCC~~",
                    "CD~DC~~",
                    "CD~DC~~",
                    "CCCCC~~")
                .where("S", IBlockMatcher.controller(loc))
                .where("~", IBlockMatcher.ANY)
                .whereOr("C", 
                <metastate:gregtech:metal_casing:4>,
                    IBlockMatcher.abilityPartPredicate(
                        MultiblockAbility.IMPORT_FLUIDS,
                        MultiblockAbility.IMPORT_ITEMS,
                        MultiblockAbility.INPUT_ENERGY,
                        MultiblockAbility.EXPORT_FLUIDS,
                        MultiblockAbility.EXPORT_ITEMS
                ))
                .where("P", <metastate:gregtech:boiler_casing:1>)
                .where("D", <metastate:contenttweaker:gravity_separator_rotor_block>)
                .build())
        .addDesign(
                FactoryMultiblockShapeInfo.start()
                .aisle(
                    "CCCCC  ",
                    "SCCCC  ",
                    "CCCCC  ")
                .aisle(
                    "CCCCE P",
                    "C G CPP",
                    "CG GC  ")
                .aisle(
                    "CCCCC  ",
                    "C G CP ",
                    "CG GC  ")
                .aisle(
                    "CCCCC P",
                    "CCCCCPP",
                    "CCCCC  ")
                .where("C", <metastate:gregtech:metal_casing:4>)
                .where("P", <metastate:gregtech:boiler_casing:1>)
                .where("G", <metastate:contenttweaker:gravity_separator_rotor_block>)
                .where("S", IBlockInfo.controller(loc))
                .where("L", MetaTileEntities.FLUID_IMPORT_HATCH[1], IFacing.south())
                .where("X", MetaTileEntities.FLUID_EXPORT_HATCH[1], IFacing.north())
                .where("E", MetaTileEntities.ENERGY_INPUT_HATCH[4], IFacing.east())
                .build())
.withRecipeMap(
        FactoryRecipeMap.start(loc)
                        .maxInputs(1)
                        .maxFluidInputs(1)
                        .maxFluidOutputs(3)
                        .maxOutputs(6)
                        .build())
.withTexture(ICubeRenderer.sided("contenttweaker:blocks/machine_casing_solid_steel"))
.withZoom(0.5f)

.buildAndRegister() as Multiblock;