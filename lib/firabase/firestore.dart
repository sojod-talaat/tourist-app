import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:weather_project/firabase/Authhelper.dart';
import 'package:weather_project/models/categories.dart';
import 'package:weather_project/models/user_model.dart';

class FireStoreHelper {
  FireStoreHelper._();
  static FireStoreHelper fireStoreHelper = FireStoreHelper._();
  FirebaseFirestore firebaseInstance = FirebaseFirestore.instance;
  CollectionReference<Map<String, dynamic>> firebaseInstanceuser =
      FirebaseFirestore.instance.collection('users');

////////////////addd user///////////
  addUserToFireStore(usermodel appUser) async {
    await firebaseInstance
        .collection('users')
        .doc(appUser.id!)
        .set(appUser.toMap());
  }

  Addtofavorite(item Item, String userid) async {
    await firebaseInstance
        .collection('users')
        .doc(AuthFirebaseHelper.authhelper.getCurrentUse())
        .collection('Favorite')
        .doc(Item.id)
        .set(Item.toMap());
  }

  //////////////
  Removefavorite(item Item, String userid) async {
    await firebaseInstance
        .collection('users')
        .doc(AuthFirebaseHelper.authhelper.getCurrentUse())
        .collection('Favorite')
        .doc(Item.id)
        .delete();
  }

  Future<List<item>> getfromfavorite(String userid) async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot = await firebaseInstance
        .collection('users')
        .doc(AuthFirebaseHelper.authhelper.getCurrentUse())
        .collection('Favorite')
        .get();
    List<item> prodectss = querySnapshot.docs.map((e) {
      Map<String, dynamic> data = e.data();
      data['id'] = e.id;
      item product = item.fromMap(data);
      // product.id = e.id;
      return product;
    }).toList();
    print(prodectss.length);
    return prodectss;
  }

  Future<usermodel> getUserFromFireStore() async {
    DocumentSnapshot<Map<String, dynamic>> documentSnapshot =
        await firebaseInstance
            .collection('users')
            .doc(AuthFirebaseHelper.authhelper.getCurrentUse())
            .get();
    documentSnapshot.data();
    usermodel currentuser = usermodel.fromMap(documentSnapshot.data()!);
    print(currentuser.email);
    return currentuser;
  }

  Future<DocumentSnapshot> fetchCurrentUser(String uuid) async {
    return await firebaseInstance.collection('users').doc(uuid).get();
  }

  //////////////////////////////////////
  final String categoryCollectionName = 'categories';
  CollectionReference<Map<String, dynamic>> firebaseInstancecategory =
      FirebaseFirestore.instance.collection('categories');
  CollectionReference<Map<String, dynamic>> firebaseInstansilder =
      FirebaseFirestore.instance.collection('Slider');
  addCategoryToFireStore(Category categorys) async {
    await firebaseInstancecategory.add(categorys.toMap());
  }

  ////////////////////////////////////////////////////////////////
  Future<List<Category>> getCategoryFromFireStore() async {
    QuerySnapshot<Map<String, dynamic>> querySnapshot =
        await firebaseInstancecategory.get();
    List<QueryDocumentSnapshot<Map<String, dynamic>>> documents =
        querySnapshot.docs;
    List<Category> categories = documents.map((e) {
      Category category = Category.fromMap(e.data());
      category.catId = e.id;
      return category;
    }).toList();
    return categories;
  }

// //////////////////////////////////////////////////////////////////////////
  deleteCategory(Category category) async {
    await firebaseInstancecategory.doc(category.catId).delete();
  }

//   // updateCategory(Category category) async {
//   //   await firebaseInstancecategory.doc(category.catId).update(category.toMap());
//   // }
//   updateCategory(Category category) async {
//     await firebaseInstancecategory.doc(category.catId).update(category.toMap());
//   }

//   //////////////////////////////////////////////////////////////////////////
  Future<item> addNewProduct(item product, String catId) async {
    DocumentReference<Map<String, dynamic>> documentReference =
        await FirebaseFirestore.instance
            .collection('categories')
            .doc(catId)
            .collection("products")
            .add(product.toMap());
    product.id = documentReference.id;
    return product;
  }

// // ignore: non_constant_identifier_names
  Future<List<item>> getAlProduct(String CatId) async {
    QuerySnapshot<Map<String, dynamic>> query = await FirebaseFirestore.instance
        .collection('categories')
        .doc(CatId)
        .collection('products')
        .get();
    List<item> prodectss = query.docs.map((e) {
      Map<String, dynamic> data = e.data();
      data['id'] = e.id;
      item product = item.fromMap(data);
      // product.id = e.id;
      return product;
    }).toList();
    print(prodectss.length);
    return prodectss;
  }
}
