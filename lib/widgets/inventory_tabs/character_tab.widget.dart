import 'package:bungie_api/enums/destiny_item_type_enum.dart';
import 'package:flutter/material.dart';
import 'package:little_light/services/bungie_api/enums/destiny_item_category.enum.dart';
import 'package:little_light/services/bungie_api/enums/inventory_bucket_hash.enum.dart';
import 'package:little_light/widgets/inventory_tabs/character_tab_header.widget.dart';
import 'package:little_light/widgets/item_list/item_list.widget.dart';

class CharacterTabWidget extends StatefulWidget {
  final String characterId;
  final int currentGroup;
  final Map<int, double> scrollPositions;
  CharacterTabWidget(this.characterId, this.currentGroup,
      {this.scrollPositions});
  @override
  CharacterTabWidgetState createState() => new CharacterTabWidgetState();
}

class CharacterTabWidgetState extends State<CharacterTabWidget> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      ItemListWidget(
          key: Key("${widget.currentGroup}_${widget.characterId}"),
          padding: EdgeInsets.only(
              top: getListTopOffset(context), left: 2, right: 2),
          characterId: widget.characterId,
          bucketHashes: bucketHashes,
          scrollPositions: widget.scrollPositions,
          currentGroup: widget.currentGroup),
      TabHeaderWidget(widget.characterId),
    ]);
  }

  List<int> get bucketHashes {
    switch (widget.currentGroup) {
      case DestinyItemCategory.Armor:
        return [
          InventoryBucket.helmet,
          InventoryBucket.gauntlets,
          InventoryBucket.chestArmor,
          InventoryBucket.legArmor,
          InventoryBucket.classArmor,
        ];
      case DestinyItemCategory.Weapon:
        return [
          InventoryBucket.subclass,
          InventoryBucket.kineticWeapons,
          InventoryBucket.energyWeapons,
          InventoryBucket.powerWeapons
        ];
    }
    return [
      InventoryBucket.lostItems,
      InventoryBucket.engrams,
      InventoryBucket.ghost,
      InventoryBucket.vehicle,
      InventoryBucket.ships,
      InventoryBucket.emblems,
      InventoryBucket.consumables,
      InventoryBucket.modifications,
      InventoryBucket.shaders,
    ];
  }

  double getListTopOffset(BuildContext context) {
    return kToolbarHeight + 2;
  }
}
