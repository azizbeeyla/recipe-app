class CreateRecipeModel {
  final int categoryId, timeRequired;
  final String title, description, difficulty;
  final List<Instruction> instructions;
  final List<Ingredient> ingredients;

  CreateRecipeModel({
    required this.categoryId,
    required this.title,
    required this.description,
    required this.difficulty,
    required this.timeRequired,
    required this.instructions,
    required this.ingredients,
  });

  Map<String, dynamic> toJson() {
    return {
      'categoryId': categoryId,
      'title': title,
      'description': description,
      'difficulty': difficulty,
      'timeRequired': timeRequired,
      'instructions': instructions.map((e) => e.toJson()).toList(),
      'ingredients': ingredients.map((e) => e.toJson()).toList(),
    };
  }
}

class Instruction {
  final String text;
  final int order;

  Instruction({
    required this.text,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    return {
      'text': text,
      'order': order,
    };
  }
}

class Ingredient {
  final String amount;
  final String name;
  final int order;

  Ingredient({
    required this.amount,
    required this.name,
    required this.order,
  });

  Map<String, dynamic> toJson() {
    return {
      'amount': amount,
      'name': name,
      'order': order,
    };
  }
}
