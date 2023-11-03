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


var loc = "cosmic_pneumatic_chamber";
var meta = 10007;
val cosmic_pneumatic_chamber = Builder.start(loc, meta)
    .withPattern(
            FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.BACK, RelativeDirection.UP)
                .aisle(
                    "CCCCCCC",
                    "CCCCCCC",
                    "CCCCCCC",
                    "CCCCCCC",
                    "CCCCCCC",
                    "CCCCCCC",
                    "CCCSCCC")
                .aisle(
                    "OOOOOOO",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "OOOOOOO")
                .aisle(
                    "OOOOOOO",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "OOOOOOO")
                .aisle(
                    "OOOOOOO",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "OOOOOOO")
                .aisle(
                    "OOOOOOO",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "OOOOOOO")
                .aisle(
                    "OOOOOOO",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "O~~~~~O",
                    "OOOOOOO")
                .aisle(
                    "CCCCCCC",
                    "CCCCCCC",
                    "CCCCCCC",
                    "CCCCCCC",
                    "CCCCCCC",
                    "CCCCCCC",
                    "CCCCCCC")
                .where("S", IBlockMatcher.controller(loc))
                .where("~", IBlockMatcher.ANY)
                .whereOr("C", 
                <metastate:gregtech:metal_casing:5>,
                    IBlockMatcher.abilityPartPredicate(
                        MultiblockAbility.IMPORT_FLUIDS,
                        MultiblockAbility.IMPORT_ITEMS,
                        MultiblockAbility.INPUT_ENERGY,
                        MultiblockAbility.EXPORT_FLUIDS,
                        MultiblockAbility.EXPORT_ITEMS
                ))
                .where("F", <metastate:gregtech:frame_steel>)
                .where("G", <metastate:gtadditions:ga_transparent_casing:4>)
                .build())
        .addDesign(
                FactoryMultiblockShapeInfo.start()
                .aisle(
                    "CCCCCCC",
                    "OOOOOOO",
                    "OOOOOOO",
                    "OOOOOOO",
                    "OOOOOOO",
                    "OOOOOOO",
                    "OOOOOOO",
                    "CCCCCCC")
                .aisle(
                    "CCCCCCC",
                    "O     O",
                    "O     O",
                    "O     O",
                    "O     O",
                    "O     O",
                    "CCCCCCC")
                .aisle(
                    "CCCCCCC",
                    "O     O",
                    "O     O",
                    "O     O",
                    "O     O",
                    "O     O",
                    "CCCCCCC")
                .aisle(
                    "SCCCCCE",
                    "O     O",
                    "O     O",
                    "O     O",
                    "O     O",
                    "O     O",
                    "CCCCCCC")
                .aisle(
                    "CCCCCCC",
                    "O     O",
                    "O     O",
                    "O     O",
                    "O     O",
                    "O     O",
                    "CCCCCCC")
                .aisle(
                    "CCCCCCC",
                    "O     O",
                    "O     O",
                    "O     O",
                    "O     O",
                    "O     O",
                    "CCCCCCC")
                .aisle(
                    "CCCCCCC",
                    "OOOOOOO",
                    "OOOOOOO",
                    "OOOOOOO",
                    "OOOOOOO",
                    "OOOOOOO",
                    "OOOOOOO",
                    "CCCCCCC")
                .where("O", <metastate>)
                .where("F", <metastate:gregtech:frame_steel>)
                .where("G", <metastate:gtadditions:ga_transparent_casing:4>)
                .where("S", IBlockInfo.controller(loc))
                .where("C", <metastate:gregtech:metal_casing:5>)
                .where("L", MetaTileEntities.FLUID_IMPORT_HATCH[1], IFacing.south())
                .where("X", MetaTileEntities.FLUID_EXPORT_HATCH[1], IFacing.north())
                .where("E", MetaTileEntities.ENERGY_INPUT_HATCH[4], IFacing.east())
                .build())
.withRecipeMap(
        FactoryRecipeMap.start(loc)
                        .maxInputs(1)
                        .maxFluidInputs(1)
                        .maxFluidOutputs(1)
                        .maxOutputs(1)
                        .build())
.withTexture(ICubeRenderer.sided("contenttweaker:blocks/machine_casing_clean_stainless_steel"))
.withZoom(0.5f)

.buildAndRegister() as Multiblock;