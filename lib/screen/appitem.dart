import 'package:flutter/material.dart';

class ProductItem extends StatefulWidget {
  final String id;
  final String imageUrl;
  ProductItem(this.id, this.imageUrl);

  @override
  _ProductItemState createState() => _ProductItemState();
}

class _ProductItemState extends State<ProductItem> {
  // bool  _likeCheck = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
          child: Image.network(
            widget.imageUrl,
            fit: BoxFit.cover,
          ),
        footer: GridTileBar(
        ),
      ),
    );
  }
}



class ProductItems extends StatefulWidget {
  String id;
  String imageUrl;
  String text;

  ProductItems(this.id,this.imageUrl, this.text);

  @override
  _ProductItemsState createState() => _ProductItemsState();
}

class _ProductItemsState extends State<ProductItems> {
  // bool _likeCheck = true;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: GridTile(
        child: Image.network(
          widget.imageUrl,
          fit: BoxFit.cover,
        ),
        footer: GridTileBar(
          leading: Text(widget.text,style: TextStyle(fontSize:10,color:Colors.white,fontWeight: FontWeight.bold),), // IconButton(
          //   icon:
          //   _likeCheck ? Icon(Icons.favorite) : Icon(Icons.favorite_border),
          //   onPressed: () {
          //     setState(() {
          //       _likeCheck = !_likeCheck;
          //     });
          //   },
          // ),
          // trailing: IconButton(
          //   icon: Icon(Icons.shopping_cart),
          //   onPressed: () {},
          // ),
        ),
      ),
    );
  }
}