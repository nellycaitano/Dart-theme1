import 'dart:io';
import 'transactions.dart';
import 'budgets.dart';
import 'gestion_budget.dart';

void main() {
  print("Bienvenue dans l'application de gestion de budget!");

  stdout.write("Veuillez entrer votre budget initial : ");
  double initialBudget = double.parse(stdin.readLineSync()!);

  GestionnaireBudget gestionnaireBudget = GestionnaireBudget(initialBudget);

  while (true) {
    print("\nQue souhaitez-vous faire?");
    print("1. Enregistrer une dépense");
    print("2. Ajouter de l'argent au budget");
    print("3. Afficher le budget restant");
    print("4. Afficher toutes les dépenses");
    print("5. Afficher les dépenses par catégorie");
    print("6. Quitter");

    stdout.write("Votre choix : ");
    String choix = stdin.readLineSync()!;

    switch (choix) {
      case "1":
        enregistrerDepense(gestionnaireBudget);
        break;

      case "2":
        ajouterArgent(gestionnaireBudget);
        break;

      case "3":
        gestionnaireBudget.afficherBudgetRestant();
        break;

      case "4":
        gestionnaireBudget.afficherToutesDepenses();
        break;

      case "5":
        afficherDepensesParCategorie(gestionnaireBudget);
        break;

      case "6":
        exit(0);

      default:
        print("Choix non valide. Veuillez réessayer.");
    }
  }
}

void enregistrerDepense(GestionnaireBudget gestionnaireBudget) {
  stdout.write("Catégorie de la dépense : ");
  String category = stdin.readLineSync()!;

  stdout.write("Description : ");
  String description = stdin.readLineSync()!;

  stdout.write("Montant : ");
  double amount = double.parse(stdin.readLineSync()!);

  stdout.write('Date (YYYY-MM-DD): ');
  DateTime date = DateTime.parse(stdin.readLineSync()!);

  gestionnaireBudget.enregistrerDepense(category, description, amount, date);

  print("Dépense enregistrée avec succès!");
}

void ajouterArgent(GestionnaireBudget gestionnaireBudget) {
  stdout.write("Montant à ajouter au budget : ");
  double amount = double.parse(stdin.readLineSync()!);

  gestionnaireBudget.ajouterArgent(amount);

  print("Argent ajouté au budget avec succès!");
}

void afficherDepensesParCategorie(GestionnaireBudget gestionnaireBudget) {
  stdout.write("Veuillez entrer la catégorie : ");
  String category = stdin.readLineSync()!;

  gestionnaireBudget.afficherDepensesParCategorie(category);
}
