import 'package:week_02_fetch_applicattion/week_02_fetch_applicattion.dart';

void main(List<String> arguments) async {
  // Fetch from the dog api
  // https://dog.ceo/api/breeds/image/random
  // https://dog.ceo/api/breeds/list/all

  // Get random dog image
  const randomUrl = 'https://dog.ceo/api/breeds/image/random';
  var dogData = await getJSON(randomUrl);
  print(dogData);

  // Get all breeds
  const allBreedsUrl = 'https://dog.ceo/api/breeds/list/all';
  dogData = await getJSON(allBreedsUrl);
  print(dogData['message']['australian'][0]); // shepherd
}
