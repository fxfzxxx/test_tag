class TagItemModel {
  static List<String> tagItems = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
    'Item 6',
    'Item 7',
    'Item 8',
    'Item 9',
    'Item 10',
    'Item 11',
    'Item 12',
    'Item 13',
  ];
  // final List<String> oddIndexArray = [];
  // final List<String> evenIndexArray = [];

  static getOddEvenIndexArrays(List<String> inputList, List<String> oddIndexArray,
      List<String> evenIndexArray) {
    for (int i = 0; i < inputList.length; i++) {
      if (i % 2 == 0) {
        evenIndexArray.add(inputList[i]);
      } else {
        oddIndexArray.add(inputList[i]);
      }
    }
  }

  static get oddIndexArray {
    List<String> oddIndexArray = [];
    List<String> evenIndexArray = [];
    getOddEvenIndexArrays(tagItems, oddIndexArray, evenIndexArray);
    return oddIndexArray;
  }
  static get evenIndexArray {
    List<String> oddIndexArray = [];
    List<String> evenIndexArray = [];
    getOddEvenIndexArrays(tagItems, oddIndexArray, evenIndexArray);
    return evenIndexArray;
  }
}