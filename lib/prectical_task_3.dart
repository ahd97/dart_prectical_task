import 'dart:io';

void shiftArrayPosiotion (){
  List<int> arr = [3,2,4,6,1,7,8,5,9];
  print("$arr");
  print("Enter the posioton for shifting the elements");
  int? position = int.tryParse(stdin.readLineSync()??'');
  if(position == null){
    print("Please enter vaild input");
    return;
  }
  if((position) < 0 || (position) > arr.length){
    print("Enter valid range");
  }
  else{
    if(position == arr.length){
      arr = arr.reversed.toList();
    }
    else{
      rotateList(arr, position);
    }
  }
  print(arr);
}


void rotateList(List<int> list, int position) {
  int n = list.length;
  reverse(list, 0, position - 1);
  reverse(list, position, n - 1);
  reverse(list, 0, n - 1);
}

void reverse(List<int> list, int start, int end) {
  while (start < end) {
    int temp = list[start];
    list[start] = list[end];
    list[end] = temp;
    
    start++;
    end--;
  }
}