
import 'package:flutter/material.dart';
import '../../../../../configs/front_end_configs.dart';

class ProductDetailScreenViewe extends StatefulWidget {
  const ProductDetailScreenViewe({Key? key}) : super(key: key);

  @override
  State<ProductDetailScreenViewe> createState() => _ProductDetailScreenVieweState();
}

class _ProductDetailScreenVieweState extends State<ProductDetailScreenViewe> {
  TextEditingController emailidController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 40),
          SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child:  Text('Nintendo Switch,Gray',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: FrontEndConfigs.kPrimaryColor)),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child:  Row(
              children: [
                Container(
                  height: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(
                      color: Colors.grey
                    )
                  ),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 7),
                    child: Row(
                      children: [
                        Icon(Icons.star,size: 17,color: Color(0xff8DD0C1),),
                        SizedBox(width: 3),
                        Text('4.8',
                            style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w700,
                                color: Colors.black)),
                        SizedBox(width: 3),
                        Text('117 Reviews',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey)),

                      ],
                    ),
                  )
                ),
                SizedBox(width: 7),
                Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.grey
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: Row(
                        children: [
                          Icon(Icons.star,size: 17,color: Color(0xffBFE600),),
                          SizedBox(width: 3),
                          Text('94%',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                        ],
                      ),
                    )
                ),
                SizedBox(width: 7),
                Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            color: Colors.grey
                        )
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 7),
                      child: Row(
                        children: [
                          Icon(Icons.chat_bubble,size: 17,color: Colors.grey),
                          SizedBox(width: 3),
                          Text('8',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black)),
                        ],
                      ),
                    )
                ),
              ],
            )
          ),
          SizedBox(height: 25),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
            child: Container(
              height: 60,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Color(0xffF0F1F3)
              ),
              child:  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child:  Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                  Row(
                    children: [
                      Text('\$169.00',
                          style: TextStyle(
                              fontSize: 17,
                              fontWeight: FontWeight.w700,
                              color: FrontEndConfigs.kPrimaryColor)),
                      SizedBox(width: 10),
                      Text('from \$14 per month',
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                              color: Colors.grey)),
                    ],
                  ),
                  Icon(Icons.info_outline,color: Colors.grey,size: 17)
                  ],
                )
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
            child: Text('A document with only text and no images. The formatting codes embedded in a word processing file are not normally visible but may contain other than text ...',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey)),
          ),
          SizedBox(height: 20),
         // Padding(
         //     padding: EdgeInsets.symmetric(horizontal: 15),
         // child:  AppButton(onTap: (){}, text: 'Add to cart'),
         // ),
          SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('Delivery on 26 August',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.black54)),
            ],
          ),
          SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _getCustomText(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Text(text,
          style: const TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w500,
              color: Color(0xff495057))),
    );
  }
}
