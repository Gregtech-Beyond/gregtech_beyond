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


var loc = "dissolution_tank";
var meta = 10028;
val dissolution_tank = Builder.start(loc, meta)
    .withPattern(
            FactoryBlockPattern.start(RelativeDirection.RIGHT, RelativeDirection.BACK, RelativeDirection.UP)
                .aisle(
                    "F~~~F",
                    "~~~~~",
                    "~~~~~",
                    "~~~~~",
                    "F~~~F")
                .aisle(
                    "FFFFF",
                    "F~~~F",
                    "F~~~F",
                    "F~~~F",
                    "FFFFF")
                .aisle(
                    "FCCCF",
                    "CCCCC",
                    "CCCCC",
                    "CCCCC",
                    "FCCCF")
                .aisle(
                    "CCCCC",
                    "C~~~C",
                    "C~~~C",
                    "C~~~C",
                    "CCSCC")
                .aisle(
                    "CGGGC",
                    "G~~~G",
                    "G~~~G",
                    "G~~~G",
                    "CGGGC")
                .aisle(
                    "CGGGC",
                    "G~~~G",
                    "G~~~G",
                    "G~~~G",
                    "CGGGC")
                .aisle(
                    "CGGGC",
                    "G~~~G",
                    "G~~~G",
                    "G~~~G",
                    "CGGGC")
                .aisle(
                    "CGGGC",
                    "G~~~G",
                    "G~~~G",
                    "G~~~G",
                    "CGGGC")
                .aisle(
                    "~CCC~",
                    "CCCCC",
                    "CCCCC",
                    "CCCCC",
                    "~CCC~")
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
                    "F   F",
                    "FFFFF",
                    "FCCCF",
                    "CCCCC",
                    "CGGGC",
                    "CGGGC",
                    "CGGGC",
                    "CGGGC",
                    " CCC ")
                .aisle(
                    "     ",
                    "F   F",
                    "CCCCC",
                    "C   C",
                    "G   G",
                    "G   G",
                    "G   G",
                    "G   G",
                    "CCCCC")
                .aisle(
                    "     ",
                    "F   F",
                    "CCCCE",
                    "S   C",
                    "G   G",
                    "G   G",
                    "G   G",
                    "G   G",
                    "CCCCC")
                .aisle(
                    "     ",
                    "F   F",
                    "CCCCC",
                    "C   C",
                    "G   G",
                    "G   G",
                    "G   G",
                    "G   G",
                    "CCCCC")
                .aisle(
                    "F   F",
                    "FFFFF",
                    "FCCCF",
                    "CCCCC",
                    "CGGGC",
                    "CGGGC",
                    "CGGGC",
                    "CGGGC",
                    " CCC ")
                .where("G", <metastate:gtadditions:ga_transparent_casing:4>)
                .where("C", <metastate:gregtech:metal_casing:5>)
                .where("S", IBlockInfo.controller(loc))
                .where("F", <metastate:gregtech:frame_steel>)
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