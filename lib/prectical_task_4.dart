List<String> processInputList() {
  List<String> inputList = ["P", "P", "P", "P", "WE", "WE", "N", "N", "N", "N", "N", "S", "S", "P","P","Z"];
  // Get unique values while preserving order
  List<String> uniqueItems = [];
  for (String item in inputList) {
    if (!uniqueItems.contains(item)) {
      uniqueItems.add(item);
    }
  }

  // Count occurrences and create result list
  List<String> result = [];
  for (String item in uniqueItems) {
    int count = inputList.where((element) => element == item).length;
    result.add('$item->$count');
  }

  // Sort the result based on occurrence count (descending) and then by original order
  result.sort((a, b) {
    int countA = int.parse(a.split('->')[1]);
    int countB = int.parse(b.split('->')[1]);
    if (countB != countA) {
      return countB.compareTo(countA); // Sort by count descending
    } else {
      // If counts are equal, sort by original order
      int indexA = uniqueItems.indexOf(a.split('->')[0]);
      int indexB = uniqueItems.indexOf(b.split('->')[0]);
      return indexA.compareTo(indexB);
    }
  });

  return result;
}