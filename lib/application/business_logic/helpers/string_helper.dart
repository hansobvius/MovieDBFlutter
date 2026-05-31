String formatCategoryString(String value){
  if(value.contains("_")){
    return value.replaceAll("_", " ");
  }
  return value;
}