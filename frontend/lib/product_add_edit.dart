/* import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shop/config.dart';
import 'package:shop/models/product_model.dart';
import 'package:shop/services/api_service.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class ProductAddEdit extends StatefulWidget {
  const ProductAddEdit({Key? key}) : super(key: key);

  @override
  _ProductAddEditState createState() => _ProductAddEditState();
}

class _ProductAddEditState extends State<ProductAddEdit> {
  static final GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool isAPICallProcess = false;
  ProductModel? productModel;
  bool isEditMode = false;
  bool isImageSelected = false;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Edit Product"),
          elevation: 0,
        ),
        backgroundColor: Colors.grey[200],
        body: ProgressHUD(
          child: Form(
            key: globalKey,
            child: productForm(),
          ),
          inAsyncCall: isAPICallProcess,
          opacity: .3,
          key: UniqueKey(),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    productModel = ProductModel();
    Future.delayed(Duration.zero, () {
      if (ModalRoute.of(context)?.settings.arguments != null) {
        final Map arguments = ModalRoute.of(context)?.settings.arguments as Map;
        productModel = arguments["model"];
        isEditMode = true;
        setState(() {});
      }
    });
  }

  Widget productForm() {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: FormHelper.inputFieldWidget(
                context,
                const Icon(Icons.ac_unit),
                "Product Name",
                "Product Name", (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'Product cant be empty';
              }
              return null;
            }, (onSavedVal) {
              productModel!.productName = onSavedVal;
            },
                initialValue: productModel!.productName ?? "",
                borderColor: Colors.black,
                borderFocusColor: Colors.black,
                textColor: Colors.black,
                hintColor: Colors.black.withOpacity(.7),
                borderRadius: 10,
                showPrefixIcon: false),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10, top: 10),
            child: FormHelper.inputFieldWidget(
                context,
                const Icon(Icons.ac_unit),
                "Product Price",
                "Product Price", (onValidateVal) {
              if (onValidateVal.isEmpty) {
                return 'Product cant be empty';
              }
              return null;
            }, (onSavedVal) {
              productModel!.productPrice = int.parse(onSavedVal);
            },
                initialValue: productModel!.productPrice! == null
                    ? ""
                    : productModel!.productPrice.toString(),
                borderColor: Colors.black,
                borderFocusColor: Colors.black,
                textColor: Colors.black,
                hintColor: Colors.black.withOpacity(.7),
                borderRadius: 10,
                showPrefixIcon: false,
                suffixIcon: Icon(Icons.monetization_on)),
          ),
          picPicker(isImageSelected, productModel!.productImage ?? "", (file) {
            setState(() {
              productModel!.productImage = file.path;
              isImageSelected = true;
            });
          }),
          const SizedBox(
            height: 20,
          ),
          Center(
              child: FormHelper.submitButton("Save", () {
            if (validateAndSave()) {
              //API Service
              setState(() {
                isAPICallProcess = true;
              });
              APIservice.saveProduct(productModel!, isEditMode, isImageSelected)
                  .then((response) => {
                        if (response)
                          {
                            Navigator.pushNamedAndRemoveUntil(
                                context, '/', (route) => false)
                          }
                        else
                          {
                            FormHelper.showSimpleAlertDialog(
                                context, Config.appName, "Error Occure", "Ok",
                                () {
                              Navigator.of(context).pop();
                            })
                          }
                      });
            }
          },
                  btnColor: HexColor("#283B71"),
                  borderColor: Colors.white,
                  borderRadius: 10)),
        ],
      ),
    );
  }

  bool validateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }

  static Widget picPicker(
      bool isFileSelected, String fileName, Function onFilePicked) {
    Future<XFile?> _imageFile;
    ImagePicker _picker = ImagePicker();
    return Column(
      children: [
        fileName.isNotEmpty
            ? isFileSelected
                ? Image.file(
                    File(fileName),
                    height: 200,
                    width: 200,
                  )
                : SizedBox(
                    child: Image.network(fileName,
                        width: 200, height: 200, fit: BoxFit.scaleDown),
                  )
            : SizedBox(
                child: Image.network(
                    "https://upload.wikimedia.org/wikipedia/commons/thumb/6/65/No-Image-Placeholder/svg1665px-No-Image-Placeholder.svg.png",
                    width: 200,
                    height: 200,
                    fit: BoxFit.scaleDown),
              ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 35.0,
              width: 35.0,
              child: IconButton(
                padding: const EdgeInsets.all(0),
                icon: const Icon(Icons.image, size: 35),
                onPressed: () {
                  _imageFile = _picker.pickImage(source: ImageSource.gallery);
                  _imageFile.then((file) async {
                    onFilePicked(file);
                  });
                },
              ),
            ),
            SizedBox(
                height: 35.0,
                width: 35.0,
                child: IconButton(
                    padding: const EdgeInsets.all(0),
                    icon: const Icon(Icons.camera, size: 35),
                    onPressed: () {
                      _imageFile =
                          _picker.pickImage(source: ImageSource.camera);
                      _imageFile.then((file) async {
                        onFilePicked(file);
                      });
                    })),
          ],
        )
      ],
    );
  }
}
 */