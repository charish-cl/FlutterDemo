import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:material_floating_search_bar/material_floating_search_bar.dart';
import 'package:plece/2048/logic/grid.dart';
import 'package:plece/biology/provider_info.dart';
class ProvidePage extends StatelessWidget {
  const ProvidePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
     
  Widget buildFloatingSearchBar() {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;

  return FloatingSearchBar(
    hint: 'Search...',
    scrollPadding: const EdgeInsets.only(top: 16, bottom: 56),
    transitionDuration: const Duration(milliseconds: 800),
    transitionCurve: Curves.easeInOut,
    physics: const BouncingScrollPhysics(),
    axisAlignment: isPortrait ? 0.0 : -1.0,
    openAxisAlignment: 0.0,
    width: isPortrait ? 600 : 500,
    debounceDelay: const Duration(milliseconds: 500),
    onQueryChanged: (query) {
      // Call your model, bloc, controller here.
    },
    // Specify a custom transition to be used for
    // animating between opened and closed stated.
    transition: CircularFloatingSearchBarTransition(),
    actions: [
      FloatingSearchBarAction(
        showIfOpened: false,
        child: CircularButton(
          icon: const Icon(Icons.place),
          onPressed: () {},
        ),
      ),
      FloatingSearchBarAction.searchToClear(
        showIfClosed: false,
      ),
    ],
    builder: (context, transition) {
      return ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Material(
          color: Colors.white,
          elevation: 4.0,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: Colors.accents.map((color) {
              return Container(height: 112, color: color);
            }).toList(),
          ),
        ),
      );
    },
  );
}
    return Scaffold(
      body:Container(
        child:Column(
          children: [
            SizedBox(child: buildFloatingSearchBar(),height:90,width: double.infinity,),
            Expanded(
              child: GridView(  
                padding: EdgeInsets.only(top:20), 
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, //横轴三个子widget
                childAspectRatio: 1, //宽高比为1时，子widget
                crossAxisSpacing: 50,
                // 子元素上下的 距离
                mainAxisSpacing: 20,
                ),
              children: [
       ButtonCard(name: "鲨鱼", image: AssetImage("images/7.jfif"),newpage: ProductInfoPage(),),
       ButtonCard(name: "鲨鱼", image: AssetImage("images/7.jfif"),newpage: ProductInfoPage(),),
       ButtonCard(name: "鲨鱼", image: AssetImage("images/7.jfif"),newpage: ProductInfoPage(),),
       ButtonCard(name: "鲨鱼", image: AssetImage("images/7.jfif"),newpage: ProductInfoPage(),),
       ButtonCard(name: "鲨鱼", image: AssetImage("images/7.jfif"),newpage: ProductInfoPage(),),
       ButtonCard(name: "鲨鱼", image: AssetImage("images/7.jfif"),newpage: ProductInfoPage(),),
       ButtonCard(name: "鲨鱼", image: AssetImage("images/7.jfif"),newpage: ProductInfoPage(),),
       
              
              ],),
            ),
          ],
        )
      )
    
    );
  }
}
class ButtonCard extends StatelessWidget {
  final String name;
  final Widget newpage;
  final AssetImage image;
  const ButtonCard({Key key,this.name, this.image, this.newpage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
      decoration: BoxDecoration(
         borderRadius: BorderRadius.all(Radius.circular(25.0)),
        image: DecorationImage(
        image: this.image,
        fit: BoxFit.fill)),
      child: FloatingActionButton(
              onPressed: () {  
           Navigator.push( 
             context,
           MaterialPageRoute(builder: (context) {
              return this.newpage;
           })); },
              child: Text(this.name),
            backgroundColor:  Colors.transparent,
              
              shape: RoundedRectangleBorder(
                  // side: BorderSide(
                    
                  //   width: 1,
                  // ),
          ), 
                
      ),
    );
  }
}
